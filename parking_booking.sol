// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkingBooking {
    mapping(uint => address) public slotOwner;

    function bookSlot(uint slotNumber) public {
        require(slotOwner[slotNumber] == address(0), "Already booked");
        slotOwner[slotNumber] = msg.sender;
    }
}
