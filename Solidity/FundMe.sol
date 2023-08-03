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

        funders.push(msg.sender);   //msg.sender is the address of whoever calls the fund function
        addressToAmountFunded[msg.sender] += msg.value;
    }

    
    
    function withdraw() public {
        /* starting index, ending index, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++)
        {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0;    //resetted all the amounts of the funders to zero
        }

        //resetting the array
        funders = new address[](0);  

        
        //actually withdraw the funds


        //transfer(automatically reverts if the transaction has failed)
        payable(msg.sender).transfer(address(this).balance);
        //This keyword refers to this entire contract
        /* 
        msg.sender = address
        payable(msg.sender) = payable address
        In solitidy in order to send native blockchain token, you can only work with payable addresses
        */


        //send(in order to revert we need to include require statement)
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"Send failed!");

        //call
        (bool callSuccess,)=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed!");

    }


}