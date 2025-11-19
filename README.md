NFT Contracts Repository

This repository contains two simple Ethereum smart contracts written in Solidity, deployed using Foundry
 scripts. The contracts demonstrate basic NFT creation and dynamic SVG-based NFT functionality.

📦 Contracts
1. BasicNft

A minimal NFT contract that demonstrates the basic functionality of minting an ERC-721 token.

Deployment Script: DeployBasicNft.sol

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";


Key Features:

Deploys a simple ERC-721 NFT.

Provides a foundation for minting and transferring NFTs.

Ideal for testing, learning, or extending NFT logic.

Deployment Instructions:

forge script script/DeployBasicNft.s.sol:DeployBasicNft --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast

2. MoodNft

An advanced NFT that dynamically changes its image based on mood (happy/sad) using SVGs encoded in Base64.

Deployment Script: DeployMoodNft.sol

pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";


Key Features:

Reads sad.svg and happy.svg from the local img/ folder.

Converts SVG files to Base64-encoded image URIs.

Deploys a Mood NFT that can toggle between two images.

Demonstrates dynamic on-chain NFT metadata handling.

Deployment Instructions:

forge script script/DeployMoodNft.s.sol:DeployMoodNft --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast


SVG to Base64 Conversion:
The svgToImageURI function converts local SVG files into a Base64 data URI for NFT metadata:

function svgToImageURI(string memory svg) public pure returns (string memory) {
    string memory baseURL = "data:image/svg+xml;base64,";
    string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
    return string(abi.encodePacked(baseURL, svgBase64Encoded));
}

🛠 Prerequisites

Foundry
 installed

Solidity >=0.8.18

Node.js (for any local script running)

Ethereum RPC endpoint and private key for deployment

⚡ Usage

Clone the repository:

git clone <repo-url>
cd <repo-folder>


Install dependencies:

forge install


Deploy BasicNft:

forge script script/DeployBasicNft.s.sol:DeployBasicNft --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast


Deploy MoodNft (make sure img/sad.svg and img/happy.svg exist):

forge script script/DeployMoodNft.s.sol:DeployMoodNft --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast

🔗 References

Foundry Documentation

OpenZeppelin Base64 Library

ERC-721 NFT Standard

👏 Contributing

Feel free to fork this repo and experiment with:

Adding dynamic moods to NFTs

Creating interactive on-chain NFTs

Learning how to deploy contracts using Foundry scripts# NFT-2025
