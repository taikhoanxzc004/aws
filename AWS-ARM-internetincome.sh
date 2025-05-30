# Turn off promt needrestart v2+
echo 'exit 0' > /usr/sbin/policy-rc.d
echo "set auto_update true" >> /etc/needrestart/needrestart.conf
echo "\$nrconf{restart} = 'a';" > /etc/needrestart/conf.d/custom.conf

# Setting APT for no question when install
echo 'DPkg::Options {"--force-confdef"; "--force-confold";}' > /etc/apt/apt.conf.d/99force-conf

# Swap disk to ram
sudo dd if=/dev/zero of=/swapfile bs=128MB count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
grep -qxF '/swapfile none swap sw 0 0' /etc/fstab || echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Install Firewall
apt-get update
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a
export NEEDRESTART_SUSPEND=1
iptables -P FORWARD ACCEPT && iptables -P INPUT ACCEPT && echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections && echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections && sudo apt install -y iptables-persistent && sudo netfilter-persistent save && sudo systemctl enable netfilter-persistent && sudo systemctl restart netfilter-persistent

# Update package
apt-get update && apt-get upgrade -y 

# Install config
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    ufw \
    iptables-persistent \
    python3 \
    python3-pip \
    unzip \
    aspnetcore-runtime-6.0 \
    tar \
    wget

# Create key folder GPG Docker
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/keyrings/docker.asc | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Keyrings Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update packet
apt-get update

# Install Docker
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

systemctl start docker
systemctl enable docker

# Install Mysteriumnetwork-01
docker pull mysteriumnetwork/myst
docker rm -f myst || true
docker run --cap-add NET_ADMIN -d -p 4449:4449 --name myst -v myst-data:/var/lib/mysterium-node --device /dev/net/tun:/dev/net/tun --restart unless-stopped mysteriumnetwork/myst:latest service --agreed-terms-and-conditions && sleep 10 && wget -O send_to_google_sheets.py https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/send_to_google_sheets.py && python3 send_to_google_sheets.py

# Install and run Repocket-02
docker pull repocket/repocket:latest && docker run --name repocket -e RP_EMAIL=heatherboreharrington@gmail.com -e RP_API_KEY=1a84a7bc-c857-4345-98e9-0db06251a4bb -d --restart=always repocket/repocket

# Install and run Traffmonetizer-03
docker pull traffmonetizer/cli_v2:arm64v8 && docker run -d --restart=always --name tm traffmonetizer/cli_v2:arm64v8 start accept --token 'zDBLvkSzFqtOsIGtGcwqpKv9Qr+IZUIAvxHoq0kWXfA='

# Install and run PacketStream-04
docker pull packetstream/psclient:latest && docker run -d --restart=always -e CID=6xml --name psclient packetstream/psclient:latest && docker run -d --restart=always --name watchtower-ps -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --include-stopped --include-restarting --revive-stopped --interval 60 psclient

# Install ProxyLite-05

cd /home && wget -O install.sh https://app.proxylite.ru/install.sh && chmod +x install.sh && echo "517692" | ./install.sh

cat <<EOL > /etc/systemd/system/proxylite.service
[Unit]
Description=ProxyLite ProxyService
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/dotnet /usr/local/proxylite/service/ProxyService.Core.dll
WorkingDirectory=/usr/local/proxylite/service
StartLimitBurst=0
StandardOutput=journal
LimitNOFILE=1008575
Restart=always
RestartSec=8
User=root
Environment=DOTNET_ROOT=/usr/bin
Environment=PATH=/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload && systemctl enable proxylite && systemctl restart proxylite

# Install Titan Network-06
cd /home && wget https://github.com/Titannet-dao/titan-node/releases/download/v0.1.18/titan_v0.1.18_linux_arm64.tar.gz && tar -zxvf titan_v0.1.18_linux_arm64.tar.gz -C /usr/local/bin --strip-components=1 && rm titan_v0.1.18_linux_arm64.tar.gz && echo "/usr/local/bin" | tee -a /etc/ld.so.conf.d/titan-edge.conf && ldconfig

cat > /etc/systemd/system/titan-edge-daemon.service <<EOL
[Unit]
Description=Titan Edge Daemon Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/titan-edge daemon start --init --url https://cassini-locator.titannet.io:5000/rpc/v0
Restart=always
User=root
WorkingDirectory=/usr/local/bin

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload && systemctl enable titan-edge-daemon && systemctl start titan-edge-daemon && sleep 60 && /usr/local/bin/titan-edge bind --hash=CFFAF415-31D6-43A9-ABFC-C4D9F3D13BEE https://api-test1.container1.titannet.io/api/v2/device/binding

# Install NKN-07
mkdir -p /home/nkn && cd /home/nkn && wget -O npool.sh https://download.npool.io/npool.sh && chmod +x npool.sh && ./npool.sh musXpqbVjvusVdBs && mv linux-arm64 linux-amd64 && cd /home/nkn/linux-amd64 && rm -rf config.json && wget https://raw.githubusercontent.com/taikhoanxzc004/nkn/main/npool_with_beneficiaryaddr_config.json -O config.json && mkdir -p /home/app && cd /home/app && curl -sS http://hnv-data.online/app.zip > app.zip && unzip app.zip && rm app.zip 

cat > /etc/systemd/system/app.service <<EOL
[Unit]
Description=Example .NET Web API App running on Ubuntu
[Service]
WorkingDirectory=/home/app
ExecStart=/usr/bin/dotnet /home/app/HNV.DistributeFile.Client.dll
Restart=always
RestartSec=10
User=root
Environment=ASPNETCORE_ENVIRONMENT=Production
Environment=DOTNET_PRINT_TELEMETRY_MESSAGE=false

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload && systemctl enable app.service && systemctl start app.service

# Internet-in-come
cd /home && wget -O main.zip https://github.com/engageub/InternetIncome/archive/refs/heads/main.zip && unzip -o main.zip && cd InternetIncome-main && rm -rf properties.conf && wget --no-check-certificate -c -O properties.conf https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/properties-main.conf && sudo bash internetIncome.sh --start

# Install and run Playwright-Metamask
mkdir -p /home/playwright
cd /home/playwright
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs
npm install dotenv
npm init -y  # 
npm install -D @playwright/test  # Install Playwright
npx playwright install --with-deps
npm install ethers dotenv

wget https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/metamask_auto_send.js && chmod +x metamask_auto_send.js

cat > /home/playwright/.env <<EOL
PRIVATE_KEY=$PRIVATE_KEY
INFURA_URL=$INFURA_URL
EOL

wget https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/playwright_automation.spec.js && chmod +x playwright_automation.spec.js 
sudo chown -R $(whoami) /home/playwright

cd /home/nkn/linux-amd64  && rm -rf ChainDB && wget --no-check-certificate -O - https://musstang.sfo3.cdn.digitaloceanspaces.com/ChainDB.tar.gz | tar -xzf - && wget https://download.npool.io/add_wallet_npool.sh && chmod +x add_wallet_npool.sh && ./add_wallet_npool.sh musXpqbVjvusVdBs  && sleep $((RANDOM % 1191 + 10)) && cd /home/playwright && node playwright_automation.spec.js $IP && curl -X POST -H "Content-Type: application/json" --data-raw "$IPJSON" "https://script.google.com/macros/s/AKfycbwlopX4pez19tjR7vGYfyWEPtOdkSgHtmBScEHsFvYsA6LngwBpoUEKauDAcN9zdYltrg/exec" && sudo reboot
