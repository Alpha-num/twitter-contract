// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "forge-std/Script.sol";
import "../src/Twitter.sol";

contract DeployTwitter is Script{
    function setUp() public {}
    function run() public {
        vm.startBroadcast();
        Twitter twitter = new Twitter();
        vm.stopBroadcast();
    }
}