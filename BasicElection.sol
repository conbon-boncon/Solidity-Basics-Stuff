pragma solidity >=0.4.0 <0.9.0;

contract BasicElection{

    struct Voter{
        bool isVoted;
    }

    struct Candidate{
        string candidateName;
        uint256 voteCount;
    }

    address owner;

    mapping (address => Voter) addressToVoter;

    Candidate[] candidates;

    constructor(){
        owner = msg.sender;
    }

    function addCandidate(string memory _name) public{
        candidates.push(Candidate({
            candidateName: _name,
            voteCount: 0
        }));
    }

    function getCandidate() public view returns(Candidate[] memory){
       return candidates;
    }

    function vote(uint8 candidateId, address _addressToVoter) public{
        candidates[candidateId].voteCount += 1;
        addressToVoter[_addressToVoter].isVoted = true;
    }

    function getWinner() public returns(Candidate memory){
        uint256 initialCount = 0;
        for(uint8 i = 0; i<= candidates.length; i++){
            if(candidates[i].voteCount > initialCount){
                initialCount = candidates[i].voteCount;
                return candidates[i];
            }

        }
    }
}
