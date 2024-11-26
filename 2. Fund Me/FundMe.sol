//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe{
    function fund() public payable {
        //Allow users to send money and minimum send money
        require(msg.value > 1e18, "Didn't send enough ETH"); //minimum 1e18 = 1ETH
    }
    
    // function withdraw() public{}
}