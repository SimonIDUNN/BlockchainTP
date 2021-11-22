// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/ownership/ownable.sol";

contract newNFT is NFTokenMetadata, Ownable {

constructor() {
    nftName = "Synth NFT";
    nftSymbol = "SYN";
}

struct Monster {
    uint256 Strength;
    string Sex;
    string Image;
    string Name;
}

mapping(uint256 => Monster) monsters;
uint256[] public MonsterIds;
string public lastFight;

function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
}

function random(uint256 limit) public view returns (uint) {
    uint randomHash = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    return randomHash % limit;
}

function generateCharacter(address _to, uint256 _tokenId, string memory sex, string memory image, string memory name) public {
    Monster storage newMonster = monsters[_tokenId];
    newMonster.Strength = random(6);
    newMonster.Sex = sex;
    newMonster.Image = image;
    newMonster.Name = name;
    
    MonsterIds.push(_tokenId);
    _mint(_to, _tokenId);
}

function getMonster(uint256 _tokenId) public view returns (uint256, string memory, string memory, string memory) {
    Monster storage m = monsters[_tokenId];
    return (m.Strength,m.Sex,m.Image,m.Name);
}

  
  function fight(uint256 _tokenId1, uint256 _tokenId2) public returns (string memory) {
    //   require (msg.sender == onlyOwner(_tokenId1));
    //   Monster storage monster1 = monsters[_tokenId1];
    //   Monster storage monster2 = monsters[_tokenId2];
      uint256 Strength1 = monsters[_tokenId1].Strength * random(101)/100;
      uint256 Strength2 = monsters[_tokenId2].Strength * random(101)/100;
      string memory winner;
      if (Strength1 > Strength2) {
          monsters[_tokenId1].Strength = monsters[_tokenId1].Strength + 1;
          winner = monsters[_tokenId1].Name;
        //   return (monsters[_tokenId1].Name, monsters[_tokenId1].Strength);
      }
      else {
          monsters[_tokenId2].Strength = monsters[_tokenId2].Strength + 1;
          winner = monsters[_tokenId2].Name;
        //   return (monsters[_tokenId2].Name, monsters[_tokenId2].Strength);
      }
      return winner;    
    
  }
  
  function breeding(address _to, uint256 _tokenId, uint256 _tokenId1, uint256 _tokenId2, string memory name) public {
    Monster storage newMonster = monsters[_tokenId];
    newMonster.Sex = monsters[_tokenId1].Sex;
    newMonster.Image = monsters[_tokenId2].Image;
    newMonster.Name = name;
    uint256 Strength1 = monsters[_tokenId1].Strength;
    uint256 Strength2 = monsters[_tokenId2].Strength; 
    
    if (Strength1>Strength2) {
        newMonster.Strength = Strength1;
    }
    else {
        newMonster.Strength = Strength2;
    }
    
    
    MonsterIds.push(_tokenId);
    _mint(_to, _tokenId);
}
    
    
      
}
