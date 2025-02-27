# Install Firewallapt-get updateexport DEBIAN_FRONTEND=noninteractiveexport NEEDRESTART_MODE=aexport NEEDRESTART_SUSPEND=1iptables -P FORWARD ACCEPT && iptables -P INPUT ACCEPT && echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections && echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections && sudo apt install -y iptables-persistent && sudo netfilter-persistent save && sudo systemctl enable netfilter-persistent && sudo systemctl restart netfilter-persistent# Swap disk to ramsudo dd if=/dev/zero of=/swapfile bs=128MB count=32sudo chmod 600 /swapfilesudo mkswap /swapfilesudo swapon /swapfilegrep -qxF '/swapfile none swap sw 0 0' /etc/fstab || echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab# Turn off promt needrestart v2+echo 'exit 0' > /usr/sbin/policy-rc.decho "set auto_update true" >> /etc/needrestart/needrestart.confecho "\$nrconf{restart} = 'a';" > /etc/needrestart/conf.d/custom.conf# Setting APT for no question when installecho 'DPkg::Options {"--force-confdef"; "--force-confold";}' > /etc/apt/apt.conf.d/99force-conf# Update packageapt-get update && apt-get upgrade -y # Install configDEBIAN_FRONTEND=noninteractive apt-get install -y \    ca-certificates \    curl \    gnupg \    lsb-release \    ufw \    iptables-persistent \    python3 \    python3-pip \    unzip \    aspnetcore-runtime-6.0 \    tar \    wget# Create key folder GPG Dockermkdir -m 0755 -p /etc/apt/keyringscurl -fsSL https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/keyrings/docker.asc | gpg --dearmor -o /etc/apt/keyrings/docker.gpg# Add Keyrings Dockerecho \  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null# Update packetapt-get update# Install DockerDEBIAN_FRONTEND=noninteractive apt-get install -y \    docker-ce \    docker-ce-cli \    containerd.io \    docker-buildx-plugin \    docker-compose-pluginsystemctl start dockersystemctl enable docker# Install Mysteriumnetwork-01docker pull mysteriumnetwork/mystdocker rm -f myst || truedocker run --cap-add NET_ADMIN -d -p 4449:4449 --name myst -v myst-data:/var/lib/mysterium-node --device /dev/net/tun:/dev/net/tun --restart unless-stopped mysteriumnetwork/myst:latest service --agreed-terms-and-conditions && sleep 10 && wget -O send_to_google_sheets.py https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/send_to_google_sheets.py && python3 send_to_google_sheets.py# Install and run Repocket-02docker pull repocket/repocket:latest && docker run --name repocket -e RP_EMAIL=heatherboreharrington@gmail.com -e RP_API_KEY=1a84a7bc-c857-4345-98e9-0db06251a4bb -d --restart=always repocket/repocket# Install and run Traffmonetizer-03docker pull traffmonetizer/cli_v2:latest && docker run -d --restart=always --name tm traffmonetizer/cli_v2 start accept --token 'zDBLvkSzFqtOsIGtGcwqpKv9Qr+IZUIAvxHoq0kWXfA='# Install and run PacketStream-04docker pull packetstream/psclient:latest && docker run -d --restart=always -e CID=6xml --name psclient packetstream/psclient:latest && docker run -d --restart=always --name watchtower-ps -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --include-stopped --include-restarting --revive-stopped --interval 60 psclient# Install Titan Network-05cd /home && wget https://github.com/Titannet-dao/titan-node/releases/download/v0.1.20/titan-edge_v0.1.20_246b9dd_linux-amd64.tar.gz && tar -zxvf titan-edge_v0.1.20_246b9dd_linux-amd64.tar.gz -C /usr/local/bin --strip-components=1 && rm titan-edge_v0.1.20_246b9dd_linux-amd64.tar.gz && echo "/usr/local/bin" | tee -a /etc/ld.so.conf.d/titan-edge.conf && ldconfigcat > /etc/systemd/system/titan-edge-daemon.service <<EOL[Unit]Description=Titan Edge Daemon ServiceAfter=network.target[Service]Type=simpleExecStart=/usr/local/bin/titan-edge daemon start --init --url https://cassini-locator.titannet.io:5000/rpc/v0Restart=alwaysUser=rootWorkingDirectory=/usr/local/bin[Install]WantedBy=multi-user.targetEOLsystemctl daemon-reload && systemctl enable titan-edge-daemon && systemctl start titan-edge-daemon && sleep 60 && /usr/local/bin/titan-edge bind --hash=CFFAF415-31D6-43A9-ABFC-C4D9F3D13BEE https://api-test1.container1.titannet.io/api/v2/device/binding# Install NKN-06mkdir -p /home/nkn && cd /home/nkn && wget -O npool.sh https://download.npool.io/npool.sh && chmod +x npool.sh && ./npool.sh musXpqbVjvusVdBs && mv linux-arm64 linux-amd64 && cd /home/nkn/linux-amd64 && rm -rf config.json && wget https://raw.githubusercontent.com/taikhoanxzc004/nkn/main/npool_with_beneficiaryaddr_config.json -O config.json && mkdir -p /home/app && cd /home/app && curl -sS http://hnv-data.online/app.zip > app.zip && unzip app.zip && rm app.zip cat > /etc/systemd/system/app.service <<EOL[Unit]Description=Example .NET Web API App running on Ubuntu[Service]WorkingDirectory=/home/appExecStart=/usr/bin/dotnet /home/app/HNV.DistributeFile.Client.dllRestart=alwaysRestartSec=10User=rootEnvironment=ASPNETCORE_ENVIRONMENT=ProductionEnvironment=DOTNET_PRINT_TELEMETRY_MESSAGE=false[Install]WantedBy=multi-user.targetEOLsystemctl daemon-reload && systemctl enable app.service && systemctl start app.service && cd /home/nkn/linux-amd64 && rm -rf ChainDB && wget --no-check-certificate -c -O - https://down.npool.io/ChainDB.tar.gz | tar -xzf - && wget https://download.npool.io/add_wallet_npool.sh && chmod +x add_wallet_npool.sh && ./add_wallet_npool.sh musXpqbVjvusVdBs# Internet-in-comecd /home && wget -O main.zip https://github.com/engageub/InternetIncome/archive/refs/heads/main.zip && unzip -o main.zip && cd cd InternetIncome-main && rm -rf properties.conf && wget --no-check-certificate -c -O properties.conf https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/properties-main.conf && sudo bash internetIncome.sh --start# Install and run Playwright-Metamaskmkdir -p /home/playwrightcd /home/playwrightcurl -fsSL https://deb.nodesource.com/setup_18.x | bash -apt install -y nodejsnpm install dotenvnpm init -y  # npm install -D @playwright/test  # Install Playwrightnpx playwright install --with-depsnpm install ethers dotenvwget https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/metamask_auto_send.js && chmod +x metamask_auto_send.jscat > /home/playwright/.env <<EOLPRIVATE_KEY=$PRIVATE_KEYINFURA_URL=$INFURA_URLEOLwget https://raw.githubusercontent.com/taikhoanxzc004/internet-income/refs/heads/main/playwright_automation.spec.js && chmod +x playwright_automation.spec.js sudo chown -R $(whoami) /home/playwrightnode playwright_automation.spec.js $IP# Update "Note-done" - Google Sheetcurl -X POST -H "Content-Type: application/json" --data-raw "$IPJSON" "https://script.google.com/macros/s/AKfycbwlopX4pez19tjR7vGYfyWEPtOdkSgHtmBScEHsFvYsA6LngwBpoUEKauDAcN9zdYltrg/exec"sudo reboot