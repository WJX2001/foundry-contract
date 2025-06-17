// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TargetContract} from "../src/TargetContract.sol";
// import {Caller} from "../src/Caller.sol";
import {DelegateCall} from "../src/DelegateCall.sol";

contract DelegateCallTest is Test {
    TargetContract public targetContract;
    DelegateCall public delegateCaller;

    function setUp() public {
        targetContract = new TargetContract();
        delegateCaller = new DelegateCall();
    }

    function test_CallSetNumber() public {
        delegateCaller.callSetNumber(address(targetContract), 1000);
        console.log("==TargetContract Number==");
        console.log(targetContract.number());
        console.log("==DelegateCaller Number==");
        console.log(delegateCaller.number());
        
    }

    function test_CallIncrement() public {
        delegateCaller.callIncrement(address(targetContract));
        console.log("==TargetContract Number==");
        console.log(targetContract.number());
        console.log("==delegateCaller Number==");
        console.log(delegateCaller.number());
    }
}
