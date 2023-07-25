// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//Inherits all the functionality of SimpleStorage contract

contract ExtraStorage is SimpleStorage{
    //virtual, override
    function store(uint256 _Number) public override {   //overriding function taken from parent contract simplestorage
        Number = _Number + 5;
    }
}