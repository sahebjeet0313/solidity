// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentMarks {
    uint[] private marks;

    function addMarks(uint _mark) public {
        marks.push(_mark);
    }

    function getAverageMarks() public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < marks.length; i++) {
            sum += marks[i];
        }
        return marks.length > 0 ? sum / marks.length : 0;
    }
}
