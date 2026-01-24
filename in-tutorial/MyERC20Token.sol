// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {

    // Review the constructor on line 53 of the OpenZeppelin implementation.
    // It requires strings for the name and symbol you wish to use for your token.
    // They’re using a slightly different naming convention by putting the _ after the name of the parameters.
    // Like any other function, you can pass variables of any name as long as they’re the right type, so feel free to continue adding the _ in front in your contract’s constructor:

constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {

}

// That’s it. You’re done! Deploy and test, and you should see all of the functionality called for by the standard and provided by the OpenZeppelin implementation.

}