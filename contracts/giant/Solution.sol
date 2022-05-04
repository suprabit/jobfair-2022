//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IGiant is IERC721 {
    function mint() external payable;

    function tokenId() external view returns (uint8);

    function maxTokenId() external view returns (uint8);
}

contract GiantAttacker {
    IGiant public giant;

    constructor(address _giantAddress) {
        giant = IGiant(_giantAddress);
    }

    function attack() external {}
}
