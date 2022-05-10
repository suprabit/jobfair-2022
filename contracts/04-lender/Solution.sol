//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ILender {
    function deposit(uint256 amount) external;

    function borrow(
        uint256 amount,
        address target,
        address borrower,
        bytes calldata data
    ) external;
}

contract LenderAttacker {
    ILender public lender;
    IERC20 public token;

    constructor(address _token, address _lender) {
        token = IERC20(_token);
        lender = ILender(_lender);
    }

    function attack() external {}
}
