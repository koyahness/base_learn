// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The minimal elements needed for a token are pretty basic.
// Start by creating a contract called MinimalToken.
// Add a mapping to relate user addresses to the number of tokens they possess.
// Finally, add a variable to track totalSupply

contract MinimalToken {
    mapping (address => uint) public balances;
    uint public totalSupply;

    // Add a constructor that initializes the totalSupply at 3000 and assigns ownership to the contract creator
    constructor() {
    totalSupply = 3000;

    balances[msg.sender] = totalSupply / 3;
    balances[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = totalSupply / 3;
    balances[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = totalSupply / 3;
}
}