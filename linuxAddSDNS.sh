AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
sudo apt-get -y install apt-transport-https 
sudo apt-get -y update && sudo apt-get -y install azure-cli
az login -u jdooley@kinaxis.com -p 'N@b!7312'
SDNS=$(az network nic list -g JXTestTestJD --query "[*].dnsSettings.internalDomainNameSuffix | [0]" |tr -d \")
echo search $SDNS > /etc/resolvconf/resolv.conf.d/tail 
resolvconf -u