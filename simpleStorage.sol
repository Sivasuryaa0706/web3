//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract simpleStorage{
    uint256 public favNum = 2;

    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    //View: read from the blockchain but cannot modify the contract's state
    //pure: cannot read from the blockchain or modify the contract's state 
    function retrieve() public view returns(uint256){
        return favNum;
    }
}