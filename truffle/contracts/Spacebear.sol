// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@ganache/console.log/console.sol";
contract Spacebear is ERC721, ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    constructor(
    ) ERC721("Spacebear", "SBR") Ownable(msg.sender) {}

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/";
    }

    function buyToke () public payable {
        uint256 tokenId =  _nextTokenId;

        console.log("tokenId: %s", tokenId);
        require(msg.value == tokenId * 0.1 ether, "Wrong amount of money sent");

        _nextTokenId++;
        _safeMint(msg.sender, tokenId);

    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(
        uint256 tokenId
    ) public pure override(ERC721, ERC721URIStorage) returns (string memory) {
        return string(abi.encodePacked(_baseURI(),"space_bear", (tokenId+1), ".json"));
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
