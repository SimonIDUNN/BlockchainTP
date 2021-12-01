# BlockchainTP

This is an educational purpose exercise and so the code is not optimized. 
The purpose is to create a _NFT game_. 


## Setup 

1. First we need to get the code to deploy it.
    * You can either download the whole code from github or with the `git clone` shell command. 
    * Or you can simply just copy/paste the code.

2. Then open a tab in your browser and go to the [Remix Ethereum IDE](https://remix.ethereum.org/).
    * Create **2** new files with the **.sol** extension, in the **contracts** folder.
    * Name them _EPFToken.sol_ and *NFT_Project.sol*
    * Now click on the _aEPFToken.sol_ file in the github repository and copy/paste the code in the Remix one.
    * Do the same for *NFT_Project.sol*

_(Be sure to deploy the EPFToken first, we need it to create new characters!)_
3. Open the SOLIDITY COMPILER tab.
    * Select the compiler version 0.8.0
    * Click on the __Compile EPFToken.sol__ button.

4. Open the DEPLOY & RUN TRANSACTIONS tab.
    * You can select whatever fake Environment you want.
    * In Contract select _ERC20Spendable - contracts/EPFToken.sol_ 
    * Click deploy.

5. Redo 3. and 4. for the *NFT_Project.sol* file.
    * In Contract select *newNFT - contracts/NFT_Project.sol* 


## Demo

![test replacement text](./Demo/0.png)
