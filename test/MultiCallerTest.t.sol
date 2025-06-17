// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TargetContract} from "../src/TargetContract.sol";
import {TargetContractOne} from "../src/TagetContractOne.sol";
import {MultiCall, MultiCaller} from "../src/MultiCaller.sol";

contract MultiCallerTest is Test {
    TargetContract public targetContract;
    TargetContractOne public targetContractOne;
    MultiCall public multiCall;
    MultiCaller public multiCaller;

    function setUp() public {
        multiCall = new MultiCall();
        multiCaller = new MultiCaller(address(multiCall));
        targetContract = new TargetContract();
        targetContractOne = new TargetContractOne();
    }

    function test_SetNumbers() public {
        multiCaller.setNumbers(
            address(targetContract),
            50,
            address(targetContractOne),
            60
        );
        console.log("=============================");
        console.log("targetContract.number()=", targetContract.number());
        console.log("targetContractOne.number()=", targetContractOne.number());
        console.log("==============================");
    }
}
