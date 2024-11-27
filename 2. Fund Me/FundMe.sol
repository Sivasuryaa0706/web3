//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;  //Saying that uint256 variables can be accessed by priceConverter

    uint256 public minUSD = 5e18;
    
    //To store all the transactions
    address[] public funders;
    mapping(address funder => uint256 amount) public addressToAmount;

    function fund() public payable {
        //Allow users to send money and minimum send money

        //msg.value.getConversionRate() parameter followed by function when using library
        require(msg.value.getConversionRate() >= minUSD, "Didn't send enough ETH"); //minimum 1e18 = 1ETH
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }
    
    
    function withdraw() public{
        for(uint256 fundersInd =0 ;fundersInd<funders.length;fundersInd++){
            address funder = funders[fundersInd];
            addressToAmount[funder] = 0;
        }
    }
}