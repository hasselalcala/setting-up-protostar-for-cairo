# Background 

Last 3 weeks I have been learning about cairo language and how to deploy contract in Starknet. Starkware (company who developes this solutions) provides a lot of documentation, but it was really hard for me to configure and execute a contract in the testnet. 

First, to configurate the enviroment and learn about Cairo language, you can check the official docs right [here](https://www.cairo-lang.org/docs/). Also, there exist a [Youtube Channel](https://www.youtube.com/@starkware_ltd/streams) and I read this [article](https://medium.com/starknet-edu/choosing-a-starknet-development-tool-d4335d0e62a5) with some suggestion to choose a Development Tool.  

I choose protostar because allows you to test your StarkNet smart contracts with Cairo Language. In the file [setting up environment.md](https://github.com/hasselalcala/setting-up-protostar-for-cairo/blob/main/setting%20up%20environment.md) I show you the steps that I did to setting up protostar and start to work.

## How to work with this repo. 

### Cloning the repository 
```
git clone https://github.com/hasselalcala/setting-up-protostar-for-cairo.git
```

### Compile project.
```
protostar build
```

### Declare contract: 
```
protostar declare ./build/main.json --account-address [ACCOUNT_ADDRESS_FROM_ARGENTX_ WALLET] —max-fee auto —network testnet 
```

### Deploy contract: 
```
protostar deploy [CLASS_HASH] --network testnet --max-fee auto --account-address [ACCOUNT_ADDRESS_FROM_ARGENTX_ WALLET]
```

### Check tests.
```
protostar test ./tests
```

### Interact with the contract

### Executing external function with invoke command

After deploying our contract we obtain the [CONTRACT_ADDRESS] and to interact with the external functions of this contract we use de INVOKE command as follows:
```
protostar invoke --contract-address [CONTRACT_ADDRESS] --function "[FUNCTION_NAME]" --network testnet --account-address [ACCOUNT_ADDRESS_FROM_ARGENTX_ WALLET] --max-fee auto --inputs 3 5 
```

We obtain: 
```
Sending invoke transaction...                                                                                                                               
Invoke transaction was sent.
Transaction hash: 0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
StarkScan https://testnet.starkscan.co/tx/0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
Voyager   https://goerli.voyager.online/tx/0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
00:23:22 [INFO] Execution time: 5.32 s
```

### Executing view function with call command

To interact with the view functions of this contract we use de CALL command as follows:

```
protostar call --contract-address [CONTRACT_ADDRESS] --function "[FUNCTION_NAME]" --network testnet
```

We obtain: 

```
[RAW RESULT]                                                                                                                                                
[8]

[TRANSFORMED RESULT]
{
    "res": 8
}
00:50:40 [INFO] Execution time: 6.96 s
```

