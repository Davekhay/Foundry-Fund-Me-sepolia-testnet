//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();

        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundme = new FundMe(ethUsdPriceFeed);
        // 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // Sepolia ETH / USD Address
        vm.stopBroadcast();
        return fundme;
    }
}
