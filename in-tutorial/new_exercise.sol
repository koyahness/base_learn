// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** * @title AddressBook
 * @dev Manages a list of contacts with restricted access to the owner.
 */

contract AddressBook {

    // Using immutable for gas efficiency since owner is set once
    address public immutable owner;

    //define a struct of contact types
    struct Contact {
       uint id;
       string firstName;
       string lastName;
       uint[] phoneNumbers;
    }

 // Mapping for fast ID-based lookups
    mapping(uint => Contact) private contacts;
    // Array to keep track of all active IDs (for getAllContacts)
    uint[] private contactIds;

// Custom Errors
    error NotOwner(address caller);
    error ContactNotFound(uint contactId);
    error ContactAlreadyExists(uint contactId);

modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner(msg.sender);
        _;
    }
    
    //add contsructor for owner to be set when contract deployed
   constructor(address _owner) {
        owner = _owner;
    }

    /**
     * @dev 
     */
    function addContact(
        uint _id, 
        string memory _firstName, 
        string memory _lastName, 
        uint[] memory _phoneNumbers
    ) public onlyOwner {
        if (contacts[_id].id != 0) revert ContactAlreadyExists(_id);

        Contact memory newContact = Contact({
            id: _id,
            firstName: _firstName,
            lastName: _lastName,
            phoneNumbers: _phoneNumbers
        });

        contacts[_id] = newContact;
        contactIds.push(_id);
    }


    /**
     * @dev Deletes a contact by ID. In Solidity, "delete" resets the struct to default values.
     */
    function deleteContact(uint _id) public onlyOwner {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        
        delete contacts[_id];
        
        // Note: To truly remove from contactIds array, you would need to loop or swap.
        // For simplicity here, we just delete the mapping entry.
    }
    
    
    /**
     * @dev Returns a specific contact. Made 'view' to avoid gas costs on calls.
     */
    function getContact(uint _id) public view returns (Contact memory) {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        return contacts[_id];
    }











    //declare struct variable of Contact type
    Contact public contacts;

    //declare struct array variable of Contact type
    Contact[] public non_deleted_contacts;
    
    // define and error
    error NotOwner(address _msg_sender);


    // add function
    function addContactw(uint _id, string memory _firstName, string memory _lastName, uint[] memory _phoneNumbers) public {
        if (owner == msg.sender){

           contacts = Contact (
            _id,
            _firstName,
            _lastName,
            _phoneNumbers
           );

           non_deleted_contacts.push(contacts);


        } else {revert NotOwner(msg.sender);}

    }

    // define an error for ContactNotFound
    error ContactNotFound(uint _msg_sender);

    // remove contact function
    function deleteContactw(uint _id) public returns (Contact memory){

    if (owner == msg.sender){

        if(_id == contacts.id){

            delete contacts;

        } else{revert ContactNotFound(_id);}


        } else {revert NotOwner(msg.sender);}
}


    //add getcontact function
    function getContactw(uint _id) public returns (Contact memory){

         if(_id == contacts.id){

            return contacts[_id];

        } else{revert ContactNotFound(_id);}

    }

    //add getallcontact function
    function getAllContacts() public returns (Contact[] memory) {
        return non_deleted_contacts;
    }

}


contract AddressBookFactory{

    function deploy () public returns (AddressBook) {
        // deploy AddressBook, owner = msg.sender

    AddressBook newAddressBookContract = new AddressBook(msg.sender);

    return newAddressBookContract; //newAddressBookContract.address

    }
    
}