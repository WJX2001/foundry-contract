// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CrossContractCall} from "../src/contracts/CrossContractCall.sol";
import {CrossContractCallOne} from "../src/contracts/CrossContractCallOne.sol";

contract CrossContractCallTest is Test {
    CrossContractCall public crossContractCall;
    CrossContractCallOne public crossContractCallOne;

    function setUp() public {
        crossContractCall = new CrossContractCall();
        crossContractCallOne = new CrossContractCallOne(crossContractCall);
    }

    function test_SetNUmbers() public {
        crossContractCallOne.addThree();
        console.log(
            "addThree Result=",
            CrossContractCall(crossContractCall).result()
        );
        crossContractCallOne.addResult();
        console.log(
            "addResult Result=",
            CrossContractCall(crossContractCall).result()
        );
    }
}
