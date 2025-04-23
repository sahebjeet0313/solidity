// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Timelock {
    uint public unlockTime;
    address public owner;

    constructor(uint _delay) payable {
        owner = msg.sender;
        unlockTime = block.timestamp + _delay;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        require(block.timestamp >= unlockTime, "Locked");
        payable(owner).transfer(address(this).balance);
    }
}
