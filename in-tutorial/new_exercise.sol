// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//knowledge of the new keyword.

contract AddressBook {

    // add function
    function addContact() public {};

    // remove function

    function removeContact() public {};

}


contract AddressBookFactory{

    AddressBook newContract = new AddressBook();
    
}