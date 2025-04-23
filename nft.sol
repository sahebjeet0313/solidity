// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FanGameNFT is ERC721URIStorage, Ownable {
    uint public tokenCount;

    constructor() ERC721("FanGameNFT", "FGN") Ownable(msg.sender) {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint) {
        tokenCount += 1;
        _mint(recipient, tokenCount);
        _setTokenURI(tokenCount, tokenURI);
        return tokenCount;
    }
}
