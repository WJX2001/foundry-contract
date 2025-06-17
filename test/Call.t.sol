// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TargetContract} from "../src/TargetContract.sol";
import {StaticCaller} from "../src/StaticCaller.sol";
import {Caller} from "../src/Caller.sol";

contract CallTest is Test {
    TargetContract public targetContract;
    Caller public caller;
    StaticCaller public staticCaller;

    function setUp() public {
        targetContract = new TargetContract();
        caller = new Caller();
        staticCaller = new StaticCaller();
    }

    function test_CallSetNumber() public {
        caller.callSetNumber(address(targetContract), 1000);
        console.log("==TargetContract Number==");
        console.log(targetContract.number());
        console.log("==TargetContract Number==");
    }

    function test_CallIncrement() public {
        caller.callIncrement(address(targetContract));
        console.log("==TargetContract Number==");
        console.log(targetContract.number());
        console.log("==TargetContract Number==");
    }

    // 测试 使用 staticCall 函数
    function test_ReadNumber() public {
      targetContract.setNumber(1000);
      console.log("==staticCaller's Number==");
      uint256 value = staticCaller.readNumber(address(targetContract));
      console.log(value);
      console.log("==staticCaller's Number==");
    }
}
