echo "Before deploying, please check if your fabric servers are UP, using ./startFabric"

echo "Restart Fabric Servers"
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)
systemctl restart docker
cd fabric-dev-servers
./stopFabric.sh
./teardownFabric.sh
./startFabric.sh
cd ..

composer archive create -t dir -n .
composer network install --card PeerAdmin@hlfv1 --archiveFile first-app@0.0.1.bna
composer network start --networkName first-app --networkVersion 0.0.1 --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file networkadmin.card
composer card import --file networkadmin.card
composer network ping --card admin@first-app
