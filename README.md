Download chrome extension
https://chrome.google.com/webstore/detail/argent-x/dlcobpjiigpikoobohmabehhmhfoodbb?hl=es-419



Create a new Wallet and account 

Copy your account address and go to the starkness faucet to obtain some founds https://faucet.goerli.starknet.io/




Wait a few minutes, until the account contract be deploy in the network, to verify this you can check in starkscan using the account address or using your argent wallet go to the activity option and you can see the transaction 

https://testnet.starkscan.co/
https://goerli.voyager.online/

Now, let’s install brew, python3.9 and Cairo-lang environment in our computer. Open terminal and use the following command:

To install brew: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

To install python3.9:

Using brew: brew install python@3.9
Using python official page: https://www.python.org/downloads/release/python-390/

Install gmp: brew install gmp

Install cargo-lang python package: pip3 install cairo-lang


Now, we are going to configure a new cairo project with protostar

	0.	Copy and run in a terminal the following command:
curl -L https://raw.githubusercontent.com/software-mansion/protostar/master/install.sh | bash
source /Users/hassel/.bashrc
 
	0.	Run protostar -v to verify that installation is complete
	0.	Run protostar init your-project-name, this generate 3 directories:
	•	src — A directory for your code.
	•	lib — A default directory for an external dependencies.
	•	tests — A directory storing tests.

protostar.toml is the file which contains your command configurations. According to the official docs, it can be used to avoid passing arguments every time you run a command. Protostar searches for an argument value in the ["protostar.COMMAND_NAME"] section, for example: 

["protostar.build"]
cairo-path = ["./lib/cairo_contracts/src"]

We put our source code in src directory and then we are going to compile the file  running 

protostar build

We obtain:
 Building projects' contracts                                                                                                                                
Class hash for contract "main": 0x63c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3
17:52:32 [INFO] Execution time: 6.07 s

If is the first time you use protostar, is necessary to deploy the account using protostar calculate-account-address command

protostar calculate-account-address --account-class-hash 0x025ec026985a3bf9d0cc1fe17326b245dfdc3ff89b8fde106542a3ea56c5a918 --account-address-salt 1 

We obtain
Address: 0x00b89a4302ea68352488fe1bcc9b0e01cd71dc4d630e5e69194c9e60084996fe                                                                                 
17:55:47 [INFO] Execution time: 2.57 s

We need to export the private key of the account. We check for PROTOSTAR_ACCOUNT_PRIVATE_KEY environment variable, and use it if it's available.

export PROTOSTAR_ACCOUNT_PRIVATE_KEY=private key from argent Wallet 

Now, let’s declare the json contract: 

protostar declare ./build/main.json --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD —max-fee auto —network testnet 

Declare transaction was sent.                                                                                                                               
Class hash: 0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3
StarkScan https://testnet.starkscan.co/class/0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3
Voyager   https://goerli.voyager.online/class/0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3

Transaction hash: 0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
StarkScan https://testnet.starkscan.co/tx/0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
Voyager   https://goerli.voyager.online/tx/0x045877346ba1ea22a15012e4a028c33196592c35d3d0f94471744fd8c52cbc22
18:00:50 [INFO] Execution time: 11.63 s


And deploying the contract to the testnet

protostar deploy 0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3 --network testnet --max-fee auto --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD


Invoke transaction was sent to the Universal Deployer Contract.                                                                                             
Contract address: 0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42
StarkScan https://testnet.starkscan.co/contract/0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42
Voyager   https://goerli.voyager.online/contract/0x03af31eac66655778fe4cd6614416657557dc685c703e020a10477a656e2ca42

Transaction hash: 1069811621407037610972459756819955221880607029463709887313447568671420675488
StarkScan https://testnet.starkscan.co/tx/0x025d7dee76458b782d106006f6d0bf8337b8854f7f2c1433053fbb999b4375a0
Voyager   https://goerli.voyager.online/tx/0x025d7dee76458b782d106006f6d0bf8337b8854f7f2c1433053fbb999b4375a0
18:05:52 [INFO] Execution time: 4.61 s



If we made some changes in the contract, we need to compile, declare, deploy the contract
 COMPILE: protostar build

DECLARE: protostar declare ./build/main.json --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD —max-fee auto —network testnet 

DEPLOY: protostar deploy 0x063c8113870a0028905684995a4b64460287a0e4c816e93ce70f9327316d3ea3 --network testnet --max-fee auto --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD


—————FOR CALCULATOR CONTRACT —————————
protostar build 

protostar declare ./build/calculator.json --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD --network testnet --max-fee auto
Declare transaction was sent.                                                                                                                               
Class hash: 0x06e49ab88964e739e652ecd01486724b42d2200a24c470e1c7fb0f485720f6e4
StarkScan https://testnet.starkscan.co/class/0x06e49ab88964e739e652ecd01486724b42d2200a24c470e1c7fb0f485720f6e4
Voyager   https://goerli.voyager.online/class/0x06e49ab88964e739e652ecd01486724b42d2200a24c470e1c7fb0f485720f6e4

Transaction hash: 0x0500d24c1a637d1e5fdcdaca3c0deedef1a1a45835440d5158a9e376e1edf280
StarkScan https://testnet.starkscan.co/tx/0x0500d24c1a637d1e5fdcdaca3c0deedef1a1a45835440d5158a9e376e1edf280
Voyager   https://goerli.voyager.online/tx/0x0500d24c1a637d1e5fdcdaca3c0deedef1a1a45835440d5158a9e376e1edf280
23:27:47 [INFO] Execution time: 10.74 s



protostar deploy 0x06e49ab88964e739e652ecd01486724b42d2200a24c470e1c7fb0f485720f6e4 --network testnet --max-fee auto --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD
Invoke transaction was sent to the Universal Deployer Contract.                                                                                             
Contract address: 0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e
StarkScan https://testnet.starkscan.co/contract/0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e
Voyager   https://goerli.voyager.online/contract/0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e

Transaction hash: 2366714736212014181117812710978440917364933740285657015909548150660528239373
StarkScan https://testnet.starkscan.co/tx/0x053b83589096d69ce26faa226c4429a4d8a2e518c27d05748292b01bfea2730d
Voyager   https://goerli.voyager.online/tx/0x053b83589096d69ce26faa226c4429a4d8a2e518c27d05748292b01bfea2730d
23:52:11 [INFO] Execution time: 5.39 s

//Executing external function with invoke command

protostar invoke --contract-address 0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e --function "set_Sum" --network testnet --account-address 0x01432C1d26d4b210A8cd7e3418F5aad4886FCA75b579da88D73c3C0902E192dD --max-fee auto --inputs 3 5 
Sending invoke transaction...                                                                                                                               
Invoke transaction was sent.
Transaction hash: 0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
StarkScan https://testnet.starkscan.co/tx/0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
Voyager   https://goerli.voyager.online/tx/0x00badbee6ae75ebfee51c89b0ad23d3b0331b1962d87d709a9dd3eb0fc63bd39
00:23:22 [INFO] Execution time: 5.32 s

//executing view function with call command

protostar call --contract-address 0x04ad3b268905128c7f5b9a71fa40bc38038aafc53ff6c0280ead2ddd615ffe9e --function "get_Sum" --network testnet
[RAW RESULT]                                                                                                                                                
[8]

[TRANSFORMED RESULT]
{
    "res": 8
}
00:50:40 [INFO] Execution time: 6.96 s
