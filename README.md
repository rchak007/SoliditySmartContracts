

## `AssociateProfitSplitter` contract

Implemented an`AssociateProfitSplitter` contract. This will accept Ether into the contract and divide the Ether evenly among the associate level employees. This will allow the Human Resources department to pay employees quickly and efficiently.

Written in Solidity and deployed on Ganache.

Executed Functions of contract on Remix IDE.

## Remix IDE / Solidity

[Solidity code- AssociateProfitSplitter.sol](https://gist.github.com/rchak007/b657bbab479359f0b83268dce6e451e5)





## Ganache

Intial balances on Ganache.

in Blue is from where we will Deploy and also Deposit. the 3 accounts are in RED which are set when deployinig through the Constructor.

![image-20210908224010571](Images/deploy2.png)







Initial contract creation:

![image-20210908224921775](Images/deploy3.png)





Now depositing 4 Ether. So 2 accounts got 1.33 each but one got 1.34.

![image-20210908225021080](Images/deposit.png)



Accounts now reflect the balances 4/3 = 1.33

![image-20210908225110975](Images/depost_result.png)



