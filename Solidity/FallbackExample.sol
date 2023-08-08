// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {
    uint256 public result;

    //Dont add function before receive since it's a special function recognized by solidity
    receive() external payable {
        result = 1;
    }
    //If ETH is sent to this contract, then receive is triggered, and this function is triggered any time 
    //a transcation is sent to this contract(triggered only if calldata is blank)!

    /* When data is entered with transaction, remix looks for a function that matches given data, looks for fallback,
    if not found then returns an error! */

    //Fallback works similar to receive except that it can work even if data is passed with the transacation
    fallback() external payable {
        result = 2;
    }
    //Again we dont not use the function keyword due to the same reason!
    //Constructor is another type of special function with whom we don't require function keyword

    
}