# Only one single output remains unspent from block 123,321. What address was it sent to?
hash=$(bitcoin-cli getblockhash 123321)
listofTXID=$(bitcoin-cli getblock $hash | jq -r '.tx[]')

declare -a utxo
for txid in $listofTXID; do
    txHEX=$(bitcoin-cli getrawtransaction $txid)
    txJSON=$(bitcoin-cli decoderawtransaction $txHEX)
    for vout in $(echo $txJSON | jq -r '.vout | keys[]'); do
        unspentOutput=$(bitcoin-cli gettxout $txid $vout)
        if [ ! -z "$unspentOutput" ]; then
            AddressOutput=$(echo $txJSON | jq -r ".vout[$vout].scriptPubKey.address")
            utxo+=("$AddressOutput")
        fi
    done
done
echo "$utxo"
