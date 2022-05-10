//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IBank {
    function deposit() external payable;

    function withdraw(uint256 amount) external;
}

contract BankAttacker {
    IBank public bank;

    constructor(address _bank) {
        bank = IBank(_bank);
    }

    function attack() external {}
}
