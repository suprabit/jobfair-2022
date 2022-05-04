//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface ILender {}

contract Solution {
    IERC721 public giant;

    constructor(address _giant) {
        giant = IERC721(_giant);
    }

    function run() external {}
}
