// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Spacebear.sol";

contract SpacebearTest is Test{
 Spacebear spacebear;

 function setUp () public {
   spacebear = new Spacebear();
 }


 function testNameIsSpacebear () public view {
  assertEq(spacebear.name(), "Spacebear");
 }

 function testMintingNFTs () public {
  // console.log("msg.sender: ", msg.sender);
  spacebear.safeMint(msg.sender);
  // console.log("tokenURI", spacebear.tokenURI(0));
  assertEq(spacebear.ownerOf(0), msg.sender);
  assertEq(spacebear.tokenURI(0), "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/spacebear_1.json");
 }


 function testNFTCreationWrongOwner() public {
  address purchaser = address(0x1);
  vm.startPrank(purchaser);
  vm.expectRevert();
  spacebear.safeMint(purchaser);
  vm.stopPrank();
 }

 function testNFTBuyToken () public {
  address purchaser = address(0x2);
  vm.startPrank(purchaser);
  spacebear.buyToken();
  vm.stopPrank();
  assertEq(spacebear.ownerOf(0), purchaser);

 }
}