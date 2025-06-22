// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FunctionSelector} from "../src/FunctionSelector.sol";

contract CounterScript is Script {
    FunctionSelector public functionSelector;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        functionSelector = new FunctionSelector();

        vm.stopBroadcast();
    }
}
