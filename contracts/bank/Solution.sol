//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IBank {
    function deposit(uint256 amount) external;

    function withdraw(uint256 amount) external;
}

contract Solution {
    IBank public bank;

    constructor(address _bank) {
        bank = IBank(_bank);
    }

    function run() external {}
}
