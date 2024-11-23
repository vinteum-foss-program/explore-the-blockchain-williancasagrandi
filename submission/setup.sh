wget https://bitcoincore.org/bin/bitcoin-core-27.1/bitcoin-27.1-x86_64-linux-gnu.tar.gz
tar -xzvf bitcoin-27.1-x86_64-linux-gnu.tar.gz
ln -s $PWD/bitcoin-27.1/bin/* /usr/local/bin/
mkdir -p ~/.bitcoin
echo "rpcconnect=84.247.182.145" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=user_154" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=6zkgruzA7cAS" >> ~/.bitcoin/bitcoin.conf
