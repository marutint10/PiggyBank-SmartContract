//SPDX-License-Identifier: MIT
pragma solidity^0.8.13;
contract PiggyBank{
    address public owner;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);

    constructor(){
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external payable{
        require(msg.sender == owner, "only owner can access");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    } 
}