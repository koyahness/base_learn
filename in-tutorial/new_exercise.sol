// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//knowledge of the new keyword.

contract AddressBook {

    struct {

    }

    // add function
    function addContact() public {}

    // remove function
    function removeContact() public {}

    //view function
    function viewContact() public {}

}


contract AddressBookFactory{

    AddressBook newContract = new AddressBook();
    
}