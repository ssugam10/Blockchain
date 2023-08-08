// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";


error NotOwner();
contract FundMe{
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18; //we want the value in terms of USD, not eth
    //variables set only once, later not changed can be used with the constant keyword

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    address public immutable i_owner;   
    //Variables which are assigned only once after declaration(assignment and decleration are at different lines)
    //Such variables can be declared with the immutable keyword

    constructor(){     //gets executed as soon as the contract gets deployed! 
        i_owner = msg.sender;
    }


    function fund() public payable {
        //Want to be able to set a minimum fund amount in USD

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!");  // 1e18 = 1*10**18
        //18 decimal places

        //Money math is done in terms of wei thats why it needs to be set as 1e18 wei which is 1 ethereum
        //require keyword is a check, if money isn't enough, it reverts and sends back an error message
        //reverting is undoing any action performed before and sending the remaining gas back

        // Now minUsd is in terms of USD but msg.value is in eth, so how do we do the conversion?
        // Here is where blockchain orcales come into play 

        funders.push(msg.sender);   //msg.sender is the address of whoever calls the fund function
        addressToAmountFunded[msg.sender] += msg.value;
    }

    
    
    function withdraw() public onlyOwner {
        //Ensures that withdraw function is only called by the owner
        /* starting index, ending index, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++)
        {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0;    //resetted all the amounts of the funders to zero
        }

        //resetting the array
        funders = new address[](0);  

        
        //actually withdraw the funds


        // //transfer(automatically reverts if the transaction has failed)
        // payable(msg.sender).transfer(address(this).balance);
        // //This keyword refers to this entire contract
        // /* 
        // msg.sender = address
        // payable(msg.sender) = payable address
        // In solitidy in order to send native blockchain token, you can only work with payable addresses
        // Transfer automatically reverts if the transaction has failed
        // */


        // //send(in order to revert we need to include require statement)
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess,"Send failed!");
        // //send reverts only if you add require statement as above

        //call
        (bool callSuccess,)=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed!");
    }

    modifier onlyOwner {
        //require(msg.sender == i_owner, "Sender is not owner!");
        if(msg.sender != i_owner){ revert NotOwner();}
        _;  //represent executing the rest of the code  
    }


    //What happens if someone send ETH in this contract without calling the fund function!!!

    receive() external payable {
        fund();
    }


    fallback() external payable {
        fund();
    }

    //Now even if someone accidentally sends us money without calling the fund function, it is directed to fund fn


    /* Using fund function correctly would've cost people relatively less gas but anyways, atleast now they are 
    getting their credit for sending money by their address being updated in the funders array */

}