// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";

contract SendAvaxScript is Script {
    function run() external {
        // Load environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory rpcUrl = vm.envString("AVALANCHE_FUJI_RPC_URL");
        address payable receiverAddress = payable(vm.envAddress("RECEIVER_ADDRESS"));
        uint256 amount = vm.envUint("AMOUNT");

        // Start broadcasting transactions
        vm.createSelectFork(rpcUrl);
        vm.startBroadcast(deployerPrivateKey);

        // Send AVAX
        (bool success, ) = receiverAddress.call{value: amount}("");
        require(success, "Transfer failed.");

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
