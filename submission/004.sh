# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
#chave publica extendida
xpubKey=xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2

#descritores da chave
keyDescriptor=$(bitcoin-cli getdescriptorinfo "tr($xpubKey/0/*)")

#processa a saída JSON usando jq para extrair o valor do campo descriptor
descriptor=$(echo $keyinfosDescriptor | jq -r '.["descriptor"]')

address=$(bitcoin-cli deriveaddresses $descriptor "[0,100]")
finalkeyTaproot=$(echo $address | jq -r '.[100]')

echo $finalkeyTaproot
