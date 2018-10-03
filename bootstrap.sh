sudo apt-get install curl;

curl -O https://hyperledger.github.io/composer/v0.19/prereqs-ubuntu.sh;
sudo chmod u+x prereqs-ubuntu.sh;
./prereqs-ubuntu.sh;

mkdir hyperledger;
sudo apt-get install npm;
npm config set prefix /home/mehdi
echo "export PATH=$HOME/bin:$PATH >> ~/.bashrc"
npm install -g composer-rest-server@0.20 && \
npm install -g composer-cli@0.20 && \
npm install -g generator-hyperledger-composer@0.20;
npm install -g yo

npm install -g composer-playground@0.20
echo "Install Fabric now :)"
mkdir ~/fabric-dev-servers && cd ~/fabric-dev-servers

curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
sudo tar -xvf fabric-dev-servers.tar.gz
export FABRIC_VERSION=hlfv11
./downloadFabric.sh
./startFabric.sh
./createPeerAdminCard.sh

echo "Now, let's create a business network structure"
yo hyperledger-composer:businessnetwork
