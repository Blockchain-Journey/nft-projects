// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;


contract TransferMoney {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "You are not the owner");
        require(amount <= balance, "Insufficient balance");

        balance -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}