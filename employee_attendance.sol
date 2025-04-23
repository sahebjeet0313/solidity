// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attendance {
    mapping(address => uint) public lastMarked;

    function markAttendance() public {
        require(block.timestamp > lastMarked[msg.sender] + 1 days, "Already marked");
        lastMarked[msg.sender] = block.timestamp;
    }
}
