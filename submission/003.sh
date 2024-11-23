# How many new outputs were created by block 123,456?
#!/bin/bash

hash=$(bitcoin-cli getblockhash 123456)
block=$(bitcoin-cli getblock $hash)
txids=$(echo $block | jq -r '.tx[]')

totalOutputs=0
for txid in $txids; do
    outputs=$(bitcoin-cli getrawtransaction $txid true | jq '.vout | length')
    totalOutputs=$((totalOutputs + outputs))
done

echo $totalOutputs
