//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Solution {
    IERC721 public giant;

    constructor(address _giantAddress) {
        giant = IERC721(_giantAddress);
    }

    function run() external {}
}
