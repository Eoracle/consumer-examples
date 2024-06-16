// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IEOFeedAdapter {
    function getPairSymbol() external view returns (uint16);
    function decimals() external view returns (uint8);
    function description() external view returns (string memory);
    function version() external view returns (uint256);

    // getRoundData and latestRoundData both raise "No data present"
    // if they do not have data to report, instead of returning unset values
    // which could be misinterpreted as actual reported values.
    function getRoundData(uint80 _roundId)
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}


contract EOCLConsumerExample {
    IEOFeedAdapter public _feedAdapter;
     /**
     * Network: Holesky
     * EOFeedAdapter: 0xDD8387185C9e0a173702fc4a3285FA576141A9cd
     * Feed Symbol: BTC 
     */
    constructor() {
        _feedAdapter = IEOFeedAdapter(0xDD8387185C9e0a173702fc4a3285FA576141A9cd);
    }

    function getPrice() external view returns (int256 answer) {
        (, answer,,,) = _feedAdapter.latestRoundData();
    }
    
    function usePrice() external {
        int256 answer = this.getPrice();  
        // Do something 
        // .............
    }
}
