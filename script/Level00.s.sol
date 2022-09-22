// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level00.sol";

contract Level0Script is Script {
    Instance level0 = Instance(0xC76C78E2d1d9b32F98870fa0459AD5c12DD0766b);

    function run() public {
        vm.startBroadcast();
        level0.authenticate(level0.password());
        vm.stopBroadcast();
    }
}
