// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AppointmentBooking {
    mapping(uint => address) public slots; // slot ID to patient

    function bookSlot(uint slotId) public {
        require(slots[slotId] == address(0), "Slot booked");
        slots[slotId] = msg.sender;
    }

    function getSlotPatient(uint slotId) public view returns (address) {
        return slots[slotId];
    }
}
