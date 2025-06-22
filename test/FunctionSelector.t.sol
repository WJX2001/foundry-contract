// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FunctionSelector} from "../src/FunctionSelector.sol";

contract FunctionSelectorTest is Test {
    FunctionSelector public functionSelector;

    function setUp() public {
        functionSelector = new FunctionSelector();
    }

    function test_encodeCase() public {
        bytes memory functionBytes = functionSelector.encodeCase(1, "hello");
        console.log("=====functionBytes=====");
        console.logBytes(functionBytes);
        console.log("=====functionBytes=====");
    }


    function test_encodePackedCase() public {
        bytes memory functionBytes = functionSelector.encodePackedCase(
            1,
            "hello"
        );
        console.log("=====encodePackedCase=====");
        console.logBytes(functionBytes);
        console.log("=====encodePackedCase=====");
    }

    function test_encodeWithSelectorFunc() public {
        bytes memory functionBytes = functionSelector.encodeWithSelectorFunc(msg.sender, 10e17);
        console.log("=====encodeWithSelectorFunc=====");
        console.log(msg.sender);
        console.logBytes(functionBytes);
        console.log("=====encodeWithSelectorFunc=====");
    }

    function test_encodeWithSignatureFunc() public {
        bytes memory functionBytes = functionSelector.encodeWithSignatureFunc(msg.sender, 10e17);
        console.log("=====encodeWithSignatureFunc=====");
        console.log(msg.sender);
        console.logBytes(functionBytes);
        console.log("=====encodeWithSignatureFunc=====");
    }
}
