// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract SimpleCollectible is ERC721 {
  
  uint256 public tokenCounter;
  uint256 public maxTokens = 10001;

  constructor() public ERC721 ("Dogie", "DOG"){
    tokenCounter = 0;
  }

  function createCollectible(string memory tokenURI) public returns (uint256) {
    require(tokenCounter<=maxTokens);
    uint256 newItemId = tokenCounter;
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
    tokenCounter = tokenCounter + 1;
    return newItemId;
  }
}