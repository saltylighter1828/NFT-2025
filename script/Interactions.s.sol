// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "lib/forge-std/src/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant SHIBA = "ipfs://QmQuJvuWB18aGWF3sjR5ksd1h7599yhTFfGuju8mtSxQU1";

    address public constant DEPLOYED_NFT = 0xf25B6B767138EeFbc5A653C964c2C493f26D5559;

    function run() external {
        mintNftOnContract(DEPLOYED_NFT);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(SHIBA);
        vm.stopBroadcast();
    }
}
