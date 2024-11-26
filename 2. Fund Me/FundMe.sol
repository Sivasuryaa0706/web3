//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//Importing the interface directly from github
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{
    uint256 public minUSD = 5e18;
    
    //To store all the transactions
    address[] public funders;
    mapping(address funder => uint256 amount) public addressToAmount;

    function fund() public payable {
        //Allow users to send money and minimum send money

        require(getConversionRate(msg.value) >= 1e18, "Didn't send enough ETH"); //minimum 1e18 = 1ETH
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }
    
    function getPrice() public view returns(uint256){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer, , ,) = priceFeed.latestRoundData();
        return uint256(answer*1e10);  //returns ETH Value in USD
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).version();
    }
    // function withdraw() public{}
}