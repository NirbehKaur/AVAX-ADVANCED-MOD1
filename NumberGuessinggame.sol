// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./GameToken.sol";
contract NumberGuessingGame {
    GameToken public token;
    uint private secretNumber;
    address public admin;
    mapping(address => uint) public attempts;

    event Guess(address indexed player, bool success, uint remainingAttempts);
    event Reward(address indexed player, uint amount);
    event Penalty(address indexed player, uint amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }
    constructor(address tokenAddress) {
        token = GameToken(tokenAddress);
        admin = msg.sender;
        generateSecretNumber();
    }
    function generateSecretNumber() public onlyAdmin {
        secretNumber = (uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 10) + 1;
    }
    function guessNumber(uint guessedNumber) public {
        require(guessedNumber >= 1 && guessedNumber <= 10, "Guess must be between 1 and 10");
        require(attempts[msg.sender] < 3, "No attempts left");

        attempts[msg.sender]++;

        if (guessedNumber == secretNumber) {
            token.mint(msg.sender, 5);
            emit Reward(msg.sender, 5);
            attempts[msg.sender] = 0;  
        } else if (attempts[msg.sender] == 3) {
            require(token.balanceOf(msg.sender) >= 1, "Insufficient tokens to deduct");
            token.transferFrom(msg.sender, admin, 1);
            emit Penalty(msg.sender, 1);
            attempts[msg.sender] = 0; 
        }
        emit Guess(msg.sender, guessedNumber == secretNumber, 3 - attempts[msg.sender]);
    }

    function resetAttempts(address player) public onlyAdmin {
        attempts[player] = 0;
    }
}
