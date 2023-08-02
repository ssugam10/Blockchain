// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";   //Same as copying the entire code of SimpleStorage.sol here

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;  //This array holds the contract objects

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();  //creates new contract object
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Address
        //ABI(importing the file does the job in here!)
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];  //This variable holds contract object
        simpleStorage.store(_simpleStorageNumber);  //accessing store fn of simeplestorage.sol
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256)
    {
        return simpleStorageArray[_simpleStorageIndex].retrieve();  //accessing retrieve fn from simplestorage.sol
    }
}