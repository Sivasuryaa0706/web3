//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {simpleStorage} from "contracts/simpleStorage.sol";

contract storageFactory{
    
    //Type Visibility Name (TVN)
    simpleStorage public mySimpleStorage;

    function createSimpleStorageContract() public{
        mySimpleStorage = new simpleStorage(); //Simple storage contract has been deployed.
    }
}