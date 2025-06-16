// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TargetContract} from "../src/TargetContract.sol";
import {Caller} from "../src/Caller.sol";
contract CallTest is Test {
  TargetContract public targetContract;
  Caller public caller; 

  function setUp() public {
    targetContract = new TargetContract();
    caller = new Caller();
  }

  function test_CallSetNumber() public {
    caller.callSetNumber(address(targetContract),1000);
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

}
