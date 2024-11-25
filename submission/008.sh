# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
txHEX=$(bitcoin-cli getrawtransaction "e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163")
txJSON=$(bitcoin-cli decoderawtransaction $txHEX)
publickey=$(echo $txJSON | jq -r '
    .vin[0].txinwitness | 
    if length > 2 then .[-1][4:70] else .[1] end
')

echo "$publickey"
