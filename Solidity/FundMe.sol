// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18; //we want the value in terms of USD, not eth

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable {
        //Want to be able to set a minimum fund amount in USD

        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!");  // 1e18 = 1*10**18
        //18 decimal places

        //Money math is done in terms of wei thats why it needs to be set as 1e18 wei which is 1 ethereum
        //require keyword is a check, if money isn't enough, it reverts and sends back an error message
        //reverting is undoing any action performed before and sending the remaining gas back

        // Now minUsd is in terms of USD but msg.value is in eth, so how do we do the conversion?
        // Here is where blockchain orcales come into play 

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    
    //When calling the above function it takes two calls since the chainlink oracle is also returning the requested value
    //The above fn uses the version function which is part of aggv3 contract outside of our working space

    //function withdraw(){}
}