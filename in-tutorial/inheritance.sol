// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Solidity is an object-oriented language. Contracts can inherit from one another, allowing efficient reuse of code.
// impact inheritance has on the byte code size limit

//ContractA says that it is “contract A” and ContractB says that it is “contract B”.

contract ContractB {
    function whoAmI() external pure returns (string memory) {
        return "contract B";
    }
}


contract ContractA {
    function whoAmI() external pure returns (string memory) {
        return "contract A";
    }
}