// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HaikuNFT {

struct Haiku {
    address authorAddress;
    string line1;
    string line2;
    string line3;
    uint haikuid;
}

Haiku[] public haikus;

mapping (address => _haikuid) sharedHaikus;


uint counter = 1;



constructor () {
    
    }



function mintHaiku (string memory _line1, string memory _line2, string memory _line3) external {

    Haiku haiku_init = Haiku();
    haiku_init.authorAddress = msg.sender;
    haiku_init.line1 = _line1;
    haiku_init.line2 = _line2;
    haiku_init.line3 = _line3;
    haiku_init.haikuid = counter
    counter++;
 
}



function shareHaiku () public {

}




function getMySharedHaikus () public {

}




}