# Which tx in block 257,343 spends the coinbase output of block 256,128?
#!/bin/bash
#hash do bloco 256128
coinbaseBlockhash=$(bitcoin-cli getblockhash 256128)

#coinbase
coinbase_tx=$(bitcoin-cli getblock "$coinbaseBlockhash" true | jq -r '.tx[0]')

#hash do bloco 257343
blockhash=$(bitcoin-cli getblockhash 257343)

#percorre transações do bloco 257343
block=$(bitcoin-cli getblock "$blockhash" true)
for txid in $(echo "$block" | jq -r '.tx[]'); do
  tx=$(bitcoin-cli getrawtransaction "$txid" true)
  if echo "$tx" | jq -r '.vin[].txid' | grep -q "$coinbase_tx"; then
    echo "$txid"
    break
  fi
done
