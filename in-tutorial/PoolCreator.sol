// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@uniswap/v3-core/contracts/interfaces/IUniswapV3Factory.sol";

contract PoolCreator {
    IUniswapV3Factory public uniswapFactory;

    constructor(address _factoryAddress) {
        uniswapFactory = IUniswapV3Factory(_factoryAddress);
    }

    function createPool(
        address tokenA,
        address tokenB,
        uint24 fee
    ) external returns (address poolAddress) {
        // Check if a pool with the given tokens and fee already exists
        poolAddress = uniswapFactory.getPool(tokenA, tokenB, fee);
        if (poolAddress == address(0)) {
            // If the pool doesn't exist, create a new one
            poolAddress = uniswapFactory.createPool(tokenA, tokenB, fee);
        }

        return poolAddress;
    }
}