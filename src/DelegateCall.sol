// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DelegateCall {
    uint256 public number;

    function callSetNumber(address _target, uint _number) public {
        (bool success, ) = _target.delegatecall(
            abi.encodeWithSignature("setNumber(uint256)", _number)
        );
        require(success, "call setNumber is failed");
    }

    function callIncrement(address _target) public {
        (bool success, ) = _target.delegatecall(
            abi.encodeWithSignature("increment()")
        );
        require(success, "call increment is failed");
    }
}
