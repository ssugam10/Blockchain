// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns(uint256) {
        //ABI
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //The above address is taken from chainlink data feed of sepolia network, eth/usd address
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,)=priceFeed.latestRoundData();
        //ETH in terms of USD
        return uint256(answer * 1e10);  //we need answer of 18 decimal places, it is already of 8 by default
    }

    function getVersion() internal view returns(uint256)
    {
        AggregatorV3Interface check = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return(check.version());
    }
    //When calling the above function it takes two calls since the chainlink oracle is also returning the requested value
    //The above fn uses the version function which is part of aggv3 contract outside of our working space

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
    //After importing(in fundme.sol) first parameter can be passed using dot, but subsequent have to be passed as usual 

}