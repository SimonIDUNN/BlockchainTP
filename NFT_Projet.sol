// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
 
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";
 
contract newNFT is NFTokenMetadata, Ownable {
 
  constructor() {
    nftName = "Synth NFT";
    nftSymbol = "SYN";
  }
  
  struct Monster {
    uint256 Strenth;
    string Sex;
    string Image;
    string Name;
  }
  
  mapping(uint256 => Monster) monsters;
  uint256[] public MonsterIds;
 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
  
  function generateMonster(address _to, uint256 _tokenId) public {
    Monster storage newMonster = monsters[_tokenId];
    newMonster.Strenth = 7;
    newMonster.Sex = "M";
    newMonster.Image = "Image";
    newMonster.Name = "Simon";
    
    MonsterIds.push(_tokenId);
    _mint(_to, _tokenId);
  }
  
  function getMonstersCharacteristics(uint256 _tokenId) public view returns (uint256, string memory, string memory, string memory)  {
    Monster storage m = monsters[_tokenId];
    return (m.Strenth,m.Sex,m.Image,m.Name);
  }
 
 
  
 
}