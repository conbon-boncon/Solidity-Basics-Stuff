pragma solidity >=0.4.0 <0.9.0;

contract HelloWorld{

    string name;

    constructor() {
        name = "Tejas";
    }

    function getName() public view returns(string memory){
        return name;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function greet() public view returns(string memory){
        return name;
    }
}
