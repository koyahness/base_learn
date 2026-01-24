// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {

    // Review the constructor on line 53 of the OpenZeppelin implementation.
    // It requires strings for the name and symbol you wish to use for your token.
    // They’re using a slightly different naming convention by putting the _ after the name of the parameters.
    // Like any other function, you can pass variables of any name as long as they’re the right type, so feel free to continue adding the _ in front in your contract’s constructor:

//mint to other users. 
constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
    _mint(msg.sender, 1 * 10**18);
    _mint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 1 * 10**18);
    _mint(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 1 * 10**18);
}

// That’s it. You’re done! Deploy and test, and you should see all of the functionality called for by the standard and provided by the OpenZeppelin implementation.

// Do some testing. You’ll see that the totalSupply and all balances are zero.

// By default, the decimal for the token will be 18, which is the most common choice. Remember, there aren’t decimal types yet, so 1.0 ETH is really a uint holding 1 * 10**18, or 1000000000000000000.

// Line 251 of the OpenZeppelin implementation contains a _mint function, but it’s internal. As a result, you’ll need to figure out a minting mechanism and add it via your own contract.

}