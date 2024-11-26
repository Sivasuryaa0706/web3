//SPDX-License-Identifier: MIT

pragma solidity  ^0.8.18;

import {simpleStorage} from "contracts/simpleStorage.sol";

//Inheritace. -> Override in child, virtual in parent
contract AddFive is simpleStorage{
    function sayHello() public pure returns(string memory){
        return "Hello!";
    }

    function store(uint256 _myFavNum) public override {
        myFavNum = _myFavNum+5;
    }

}