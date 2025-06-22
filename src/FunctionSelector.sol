// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract FunctionSelector {
    /**
     * 0000000000000000000000000000000000000000000000000000000000000001
     * 0000000000000000000000000000000000000000000000000000000000000040
     * 0000000000000000000000000000000000000000000000000000000000000005
     * 68656c6c6f000000000000000000000000000000000000000000000000000000
     */
    function encodeCase(
        uint256 a,
        string memory bstr
    ) public pure returns (bytes memory) {
        return abi.encode(a, bstr);
    }

    /*
     * 0x000000000000000000000000000000000000000000000000000000000000000168656c6c6f
     */
    function encodePackedCase(
        uint256 a,
        string memory bstr
    ) public pure returns (bytes memory) {
        return abi.encodePacked(a, bstr);
    }

    /*
     * 0xa9059cbb
     * 0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38
     *                         1804c8AB1F12E6bbf3894d4083f33e07309d1f38
     * 0000000000000000000000000000000000000000000000000de0b6b3a7640000
     */
    function encodeWithSelectorFunc(
        address recipient,
        uint256 amount
    ) public pure returns (bytes memory) {
        return
            abi.encodeWithSelector(
                bytes4(keccak256("transfer(address,uint256)")),
                recipient,
                amount
            );
    }

    /*
     * 0xa9059cbb
     * 0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38
     * 0000000000000000000000000000000000000000000000000de0b6b3a7640000
     */

    function encodeWithSignatureFunc(
        address recipient,
        uint256 amount
    ) public pure returns (bytes memory) {
        return
            abi.encodeWithSignature(
                "transfer(address,uint256)",
                recipient,
                amount
            );
    }
}
