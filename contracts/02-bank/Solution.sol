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

    // Warning: attack should use more than 2 eth
    function attack() external payable {}
}
