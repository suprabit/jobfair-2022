//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Bank {
    IERC20 public token;
    mapping(address => uint256) balances;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Insufficient amount");

        token.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Insufficient amount");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        token.transfer(msg.sender, amount);
        balances[msg.sender] -= amount;
    }
}
