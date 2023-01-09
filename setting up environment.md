# First part. Install and configure a wallet.

We need a Wallet that supports Starknet, such as ArgentX, which can be used for interacting with native Starknet contracts. We use a chrome extension to install ArgentX, [here](https://chrome.google.com/webstore/detail/argent-x/dlcobpjiigpikoobohmabehhmhfoodbb?hl=es-419).

![ArgentX_extension](https://user-images.githubusercontent.com/83148363/210157525-45b7f1cc-b349-4804-bda6-fcbd7c8e995c.png)

Once we have the extension, we create a new Wallet and account. 

![ArgentX_environment](https://user-images.githubusercontent.com/83148363/210157535-310cce3a-1c68-4182-aaf3-111b82256bdb.png)

Copy your account address and go to the [Starknet faucet](https://faucet.goerli.starknet.io/) to obtain some founds.

![starkNet_Faucet](https://user-images.githubusercontent.com/83148363/210157538-ef8503a3-f9ce-4569-8dc0-e9f42631a1da.png)

Wait a few minutes, until the account contract be deploy in the network, to verify this you can check in Starkscan using the account address or using your argent wallet go to the activity option and you can see the transaction:

```
https://testnet.starkscan.co/
```

```
https://goerli.voyager.online/
```
# Second Part. Install protostar. 

Now, let’s install brew, python3.9 and Cairo-lang environment in our computer. Open terminal and use the following command:

- To install brew: 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
```

- To install python3.9:

Using brew: 
``` 
brew install python@3.9
```

Using python official page: 
```
https://www.python.org/downloads/release/python-390/
```

- Install gmp: 
```
brew install gmp
```

- Install cargo-lang python package: 
```
pip3 install cairo-lang
```

Now, we are going to install protostar to be able to use it with a new cairo project. Copy and run in a terminal the following command:

```
curl -L https://raw.githubusercontent.com/software-mansion/protostar/master/install.sh | bash
```

Restart terminal and verify that installation is complete, run: 
```
protostar -v
```

# Third Part. Setting up a new project using protostar. 

To initialize the new project, run the following command:
```
protostar init your-project-name
```

With this command, you generates 3 directories: 
- src: A directory for your code.
- lib: A default directory for an external dependencies.
- tests: A directory storing tests.

Also, `protostar.toml` is the file which contains your command configurations. According to the official docs, it can be used to avoid passing arguments every time you run a command. Protostar searches for an argument value in the ["protostar.COMMAND_NAME"] section, for example: 

```
["protostar.build"]
cairo-path = ["./lib/cairo_contracts/src"]
```

We put our source code in src directory and we can create tests.

Protostar provides a flexible testing environment for Cairo smart contracts. When we want to test a function, we create in the tests directory a new file called test_[FUNCTION_NAME].cairo, which contains a single test case. 

To execute our tests, we run:
```
protostar test ./tests
```

After our contract passed the test, then we are going to compile the source file running:
```
protostar build
```

Once we run this command, we obtain:
```
Building projects' contracts                                                                                                                                
Class hash for contract "main": 0x63c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3
17:52:32 [INFO] Execution time: 6.07 s
```

If is the first time you use protostar, is necessary to deploy the account using `protostar calculate-account-address` command

```
protostar calculate-account-address --account-class-hash [ACCOUNT_CLASS_HASH] --account-address-salt 1 
```

The value of `[ACCOUNT_CLASS_HASH]` is calculate when we create our account using ArgentX [check first part of this tutorial] and can be view on Starkscan or Voyager using our account address. After `protostar calculate-account-address` command, we obtain:
```
Address: 0x00b89a4302ea68352488fe1bcc9b0e01cd71dc4d630e5e69194c9e60084996fe                                                                                 
17:55:47 [INFO] Execution time: 2.57 s
```

Also, we need to export the private key of the account. We check for PROTOSTAR_ACCOUNT_PRIVATE_KEY environment variable, and use it if it's available.
```
export PROTOSTAR_ACCOUNT_PRIVATE_KEY=[PRIVATE_KEY_FROM_ARGENTX_WALLET] 
```

Now, let’s declare the json contract: 

```
protostar declare ./build/main.json --account-address [ACCOUNT_ADDRESS_FROM_ARGENTX_ WALLET] —max-fee auto —network testnet 
```

The result of this command is:
```
Declare transaction was sent.                                                                                                                               
Class hash: 0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3 <----- KEEP THIS VALUE
StarkScan https://testnet.starkscan.co/class/0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3
Voyager   https://goerli.voyager.online/class/0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3

Transaction hash: 0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
StarkScan https://testnet.starkscan.co/tx/0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
Voyager   https://goerli.voyager.online/tx/0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
18:00:50 [INFO] Execution time: 11.63 s
```

With this last command, we obtain the [CLASS_HASH] that we are going to use to deploy the contract to the testnet:
```
protostar deploy [CLASS_HASH] --network testnet --max-fee auto --account-address [ACCOUNT_ADDRESS_FROM_ARGENTX_ WALLET]
```

We obtain: 
```
Invoke transaction was sent to the Universal Deployer Contract.                                                                                             
Contract address: 0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42
StarkScan https://testnet.starkscan.co/contract/0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42
Voyager   https://goerli.voyager.online/contract/0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42

Transaction hash: 1069811621407037610972459756819955221880607029463709887313447568671420675488
StarkScan https://testnet.starkscan.co/tx/0x025d7dee76458b782d106006f6d0bf8337b8854f7f2c1433053fbb999b4375a0
Voyager   https://goerli.voyager.online/tx/0x025d7dee76458b782d106006f6d0bf8337b8854f7f2c1433053fbb999b4375a0
18:05:52 [INFO] Execution time: 4.61 s
```


