// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// libraries
import "./EnumerableSet.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";



contract WeightedVoting is ERC20 {

using EnumerableSet for EnumerableSet.AddressSet;

uint public maxSupply;
uint public claimedSupply;

// Issue[] public issues;

constructor {
    maxSupply = 1000000;
}

error TokensClaimed();
error AllTokensClaimed();
error NoTokensHeld();
error QuorumTooHigh(int256 quorum); //returning the quorum amount proposed
error AlreadyVoted();
error VotingClosed();

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
Vote public vote;

//mint to other users. 
  constructor() ERC20("WeightedVoting", "WV") {
        // Burn zeroeth element fo issue struct array issue[0] should retrun nothing
        issues.push();
    }

mapping (address => bool) public claimed;

function claim () public {
uint claimTokens = 100;
if (claimed[msg.sender] == false){

if (maxSupply >=  claimTokens){
     _mint(msg.sender, claimTokens);
    claimed[msg.sender] == true;
    maxSupply -= claimTokens;
    claimedSupply += claimTokens;
    }else {AllTokensClaimed();}


} else {revert TokensClaimed();}

}



function createIssue(string memory _issueDesc, uint _quorum) external returns (uint) {
    
    if (balanceOf(msg.sender) > 0){

        if(claimedSupply > _quorum){
            Issue newIssue = issues[issueIndex];
            newIssue.issueDesc = _issueDesc;
            newIssue.quorum = _quorum;
            newIssue.votesFor = 0;
            newIssue.votesAgainst = 0;
            newIssue.votesAbstain = 0;
            newIssue.totalVotes = 0;
            newIssue.passed = false;
            newIssue.closed = false;
        return issueIndex;
        
        } else {revert QuorumTooHigh(int256 quorum);}

} else {revert NoTokensHeld()}

}


function getIssue (uint _id) external returns (Issue calldata) {
    return issues[_id];
}


mapping (address => bool) public hasVoted;

function vote (uint _issueId, Vote _vote) external returns (Issue calldata) {
    
    if (issue.closed == false){

        if (hasVoted[msg.sender] == false){
            vote = _vote;
            hasVoted[msg.sender] == true;
        } revert {AlreadyVoted();}


    }else revert {VotingClosed();}


}
