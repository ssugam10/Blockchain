// SPDX-License-Identifier: MIT     
pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber=255; //255 is the upper limit of uint8

    function add() public {
        unchecked{bigNumber=bigNumber+1;}  //doing this resets it to zero
        //The earlier versions and newer versions(with unchecked keyword) work the same way as in 
        //they both fold back to zero after being incremented at the upper limit

        //unchecked keyword improves gas efficiency
    }
}