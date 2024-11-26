//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {simpleStorage} from "contracts/simpleStorage.sol";

contract storageFactory{
    
    //Type Visibility Name (TVN)
    simpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public{
        simpleStorage mySimpleStorage = new simpleStorage(); //Simple storage contract has been deployed.
        listOfSimpleStorageContracts.push(mySimpleStorage);
    }

    function sfStore(uint256 _ind,uint256 _num) public{
        //To interact with another contract we need address, ABI
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_ind];
        mySimpleStorage.store(_num);
    }

    function sfGet(uint256 _ind) public view returns(uint256){
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_ind];
        return mySimpleStorage.retrieve();
    }
}