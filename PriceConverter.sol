//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://docs.chain.link/docs/get-the-latest-price/

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

        function getPrice() internal view returns(uint256) {
        // ABI
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = pricefeed.latestRoundData();
        //ETH in USD
        //3000.00000000
        return uint256(price * 1e10);    
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return pricefeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

}
