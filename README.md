# Setting up protostar dev environment for cairo 

Last 3 weeks I have been learning about cairo language and how to deploy contract in Starknet. Starkware (company who developes this solutions) provides a lot of documentation, but it was really hard for me to configure and execute a contract in the testnet. 

First, to configurate the enviroment and learn about Cairo language, you can check the official docs right [here](https://www.cairo-lang.org/docs/). Also, there exist a [Youtube Channel](https://www.youtube.com/@starkware_ltd/streams) and I read this [article](https://medium.com/starknet-edu/choosing-a-starknet-development-tool-d4335d0e62a5) with some suggestion to choose a Development Tool.  

I choose protostar because allows you to test your StarkNet smart contracts with Cairo Language. In the following sections I show you the steps that I did to setting up protostar for a simple calculator contract and the main basis to create a test, project compilation and deploy it in the testnet. 

If it is the first time you work with Cairo/Starknet, use "setting up environment.md" and read the steps to configure the developer environmet and start to work.

## How to work with this repo. 

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

### Create and check tests.


### Interact with the contract

### Executing external function with invoke command

```
protostar invoke --contract-address 0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e --function "set_Sum" --network testnet --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD --max-fee auto --inputs 3 5 
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

```
protostar call --contract-address 0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e --function "get_Sum" --network testnet
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


