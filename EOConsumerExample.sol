// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IEOFeedManager {
    struct PriceFeed {
        uint256 value;
        uint256 timestamp;
    }

    function getLatestPriceFeed(uint16 symbol) external view returns (PriceFeed memory);
    function getLatestPriceFeeds(uint16[] calldata symbols) external view returns (PriceFeed[] memory);
}

contract EOConsumerExample {
    IEOFeedManager public _feedManager;

    /**
     * Network: Holesky
     * FeedManager: 0x723BD409703EF60d6fB9F8d986eb90099A170fd0
     */
    constructor() {
        _feedManager = IEOFeedManager(0x723BD409703EF60d6fB9F8d986eb90099A170fd0);
    }

    // Example for using IEOFeedManager.getLatestPriceFeed with a single feed.
    function getPrice() external view returns (IEOFeedManager.PriceFeed memory) {
        return _feedManager.getLatestPriceFeed(1); // 1 is the id for BTC:USD
    }

    function usePrice() external {
        IEOFeedManager.PriceFeed memory data = this.getPrice();
        uint256 value = data.value;
        uint256 timestamp = data.timestamp;
        // Do something
        // .............
    }
}
