// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract PoolCreator {
    address public uniswapFactory;

    constructor(address _factoryAddress) {
        uniswapFactory = _factoryAddress;
    }

    function createPool(
        address tokenA,
        address tokenB,
        uint24 fee
    ) external returns (address poolAddress) {
         bytes memory payload = abi.encodeWithSignature(
            "createPool(address,address,uint24)",
            tokenA,
            tokenB,
            fee
        );

        (bool success, bytes memory data) = uniswapFactory.call(payload);
        require(success, "Uniswap factory call failed");

        // The pool address should be returned as the first 32 bytes of the data
        assembly {
            poolAddress := mload(add(data, 32))
        }

        require(poolAddress != address(0), "Pool creation failed");
        return poolAddress;
    }
}