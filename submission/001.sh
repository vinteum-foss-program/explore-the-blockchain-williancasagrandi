# What is the hash of block 654,321?
#!/bin/bash
blockhash=$(bitcoin-cli getblockhash 654321)
echo "$blockhash"
