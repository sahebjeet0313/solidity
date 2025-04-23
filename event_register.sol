// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventRegistration {
    address public owner;
    uint public fee;
    address[] public participants;

    constructor(uint _fee) {
        owner = msg.sender;
        fee = _fee;
    }

    function register() public payable {
        require(msg.value == fee, "Incorrect fee");
        participants.push(msg.sender);
    }

    function getParticipants() public view returns (address[] memory) {
        return participants;
    }
}
