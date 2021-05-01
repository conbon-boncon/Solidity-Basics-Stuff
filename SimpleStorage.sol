pragma solidity >=0.4.8 <0.9.0;

contract SimpleStorage{

    uint256 public number = 0;

    function getNumber() public view returns(uint256){
        return number;
    }

    function setNumber(uint256 _number) public {
        number = _number;
    }

    function increment(uint256 _numberToIncrement) public{
        number = number + _numberToIncrement;
    }

    function decrement(uint256 _numberToDecrement) public {
        require(number > 0 && number >= _numberToDecrement, "Please input correct values");
        number = number - _numberToDecrement;
    }
}
