//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract simpleStorage{
    uint256 public myFavNum;

    //Struct
    struct Person{
        string name;
        uint256 favNum;
    }

    //Dynamic array: no limit
    Person[] public listOfPeoples;

    //Declaring mapping. (key => value)
    mapping(string => uint256) public nameToNum;
    
    function store(uint256 _myFavNum) public virtual{
        myFavNum = _myFavNum;
    }

    //View: read from the blockchain but cannot modify the contract's state
    //pure: cannot read from the blockchain or modify the contract's state 
    function retrieve() public view returns(uint256){
        return myFavNum;
    }

    function addPerson(string memory _name,uint256 _num) public{
        listOfPeoples.push(Person(_name,_num));
        nameToNum[_name] = _num;
    }
}