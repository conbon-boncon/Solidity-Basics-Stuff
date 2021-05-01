pragma solidity >=0.4.0 <0.9.0;

contract Minter{

    address minterAddress;

    mapping (address => uint256) coinBalance;

    event SentCoins(address _from, address _to, uint256 _amount);

    modifier hasBalance(address _from, uint256 _amount){
        require(coinBalance[_from] >= _amount, "You dont have sufficient balance");
        _;
    }

    constructor(){
        coinBalance[msg.sender] += 1000;
    }

    function sendCoins(address _from, address _to, uint256 _amount) public hasBalance(_from, _amount){
        coinBalance[_from] -= _amount;
        coinBalance[_to] += _amount;

        emit SentCoins(_from, _to, _amount);

    }
}
