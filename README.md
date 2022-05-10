# Suprabit JobFair 2022 Challenge

Requirements:
- `node >= 16.14.2`

Fell free to fork this repository and work on the challenge within your own repository. After you are done with the challenge, you can submit your solution to the jobs@suprabit.eu

You can also just clone the repository, and send us the code you wrote.
```
git clone https://github.com/suprabit/jobfair-2022.git
```

Install the dependencies
```
npm install
```

Test if your contracts solve the challenge by running
```
npm run test
```

# Challenges
Challenges are located inside the `contracts` directory. You only need to write code within that directory, everything else is already set up. Challenge is solved when the tests for that challenge located in the `test` directory pass successfully. Be sure to check the individual tests as you might be able to better understand the challenge.

To check if your contracts solve the challenge, run the test with the following command:
```
npm run test
```

## Challenge 1: Receiver contract
This is an intro challenge, all you have to do is make sure that the `Receiver` contract can receive ethers.

## Challenge 2: Bank contract
The goal of this challenge is to attack the `Bank` contract by withdrawing as much ether as possible. The `Bank` contract should have less then 1 ether left after the attack.

## Challenge 3: Lender contract
The goal of this challenge is to attack the `Lender` contract by taking all of the ERC20 tokens that are owned by the `Lender` contract.

## Challenge 4: Giant contract
The goal of this challenge is to attack the `Giant` contract by minting all of the available NFT's (ERC721 tokens) to yourself.

# Valuable materials
- [Ethernaut](https://ethernaut.openzeppelin.com/) - interactive Ethereum CTF style game