//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Lender {
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) {
        require(amount > 0, "Insufficient amount");
        token.transferFrom(msg.sender, address(this), amount);
    }

    function borrow(uint256 amount) {
        uint256 balanceBefore = token.balanceOf(address(this));
        require(balanceBefore >= amount, "Insufficient balance");

        token.transfer(msg.sender, amount);
        msg.sender.functionCall(
            abi.encodeWithSignature("receiveLoan(uint256)", amount)
        );

        uint256 balanceAfter = token.balanceOf(address(this));
        require(balanceBefore >= balanceAfter, "Tokens not paid back");
    }
}
