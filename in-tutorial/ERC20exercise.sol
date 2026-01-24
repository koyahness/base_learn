// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// libraries
import "./EnumerableSet.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

using EnumerableSet for EnumerableSet.AddressSet;

contract WeightedVoting is ERC20 {

uint public maxSupply;
// Issue[] public issues;

constructor {
    maxSupply = 1,000,000;
}



error TokensClaimed()
error AllTokensClaimed()
error NoTokensHeld()
error QuorumTooHigh() //returning the quorum amount proposed
error AlreadyVoted()
error VotingClosed()

struct Issue {
    EnumerableSet.AddressSet private voters;
    string issueDesc;
    uint votesFor;
    uint votesAgainst;
    uint votesAbstain;
    uint totalVotes;
    uint quorum;
    bool passed;
    bool closed;
}

enum Vote { AGAINST, FOR, ABSTAIN }

Issue[] public issues;

//mint to other users. 
constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
    _mint(msg.sender, maxSupply);
}




function claim () public {
uint claimTokens = 100;

if (maxSupply >=  claimTokens){

}

}





}