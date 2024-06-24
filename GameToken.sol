// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract GameToken {
    string public name="The NumWarrior";
    string public symbol= "TNWR";
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event Transfer(address indexed from,address indexed to,uint value);
    event Approval(address indexed owner,address indexed spender,uint value);

    constructor() {
        mint(msg.sender, 1000); 
    }

    function mint(address to,uint amount) public {
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }
    function transfer(address to,uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount,"Oops!Insufficient balance in the account");
        balanceOf[msg.sender]-= amount;
        balanceOf[to]+= amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    function approve(address spender, uint amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function transferFrom(address from, address to, uint amount) public returns (bool) {
        require(balanceOf[from] >= amount, "Insufficient balance");
        require(allowance[from][msg.sender] >= amount, "Allowance exceeded");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        allowance[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);
        return true;
    }
}
