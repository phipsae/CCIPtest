// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Client} from "@chainlink/contracts-ccip/src/v0.8/ccip/libraries/Client.sol";
import {CCIPReceiver} from "@chainlink/contracts-ccip/src/v0.8/ccip/applications/CCIPReceiver.sol";

contract CCIPReceiver_Unsafe is CCIPReceiver {
    address public latestSender;
    string public latestMessage;
    string public count;

    constructor(address router) CCIPReceiver(router) {}

    function _ccipReceive(Client.Any2EVMMessage memory message) internal override {
        latestSender = abi.decode(message.sender, (address));
        latestMessage = abi.decode(message.data , (string));
    }
}

// CCIPReceiver_Unsafe deployed to  0x3493ce5a8Dd910e4913017b8Cf9D8c275d0A698a

// cast send 0x12eCc82558bB53783D00e5C411c9F8fFebfFec73 --rpc-url https://avalanche-fuji-c-chain-rpc.publicnode.com --private-key $PRIVATE_KEY --gas-limit 100000 "send(address,string,uint64)" 0x3493ce5a8Dd910e4913017b8Cf9D8c275d0A698a "CCIP Masterclass" 16015286601757825753