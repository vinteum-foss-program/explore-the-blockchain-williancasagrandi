# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

getTransactionHEX=$(bitcoin-cli getrawtransaction "37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517")
decodedtransactionjSON=$(bitcoin-cli decoderawtransaction "$getTransactionHEX")
publicKeysJSON=($(echo "$decodedtransactionjSON" | jq -r '.vin[].txinwitness[1]'))
multisigJSON=$(bitcoin-cli createmultisig 1 "[\"${publicKeysJSON[0]}\",\"${publicKeysJSON[1]}\",\"${publicKeysJSON[2]}\",\"${publicKeysJSON[3]}\"]")

echo "$multisigJSON" | jq -r ".address" 
