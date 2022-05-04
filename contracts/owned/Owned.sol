//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Owned {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setOwner(address _owner) external {
        // ** CODE YOUR SOLUTION HERE ** //

        owner = _owner;
    }
}
