//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//Importing the interface directly from github
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{
    uint256 public minUSD = 5;

    function fund() public payable {
        //Allow users to send money and minimum send money

        require(msg.value >= 1e18, "Didn't send enough ETH"); //minimum 1e18 = 1ETH
    }
    
    function getPrice() public{
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI

    }

    function getConversionRate() public{

    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).version();
    }
    // function withdraw() public{}
}