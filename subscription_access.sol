// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubscriptionAccess {
    mapping(address => uint) public subscriptions;
    uint public fee = 1 ether;

    function subscribe() public payable {
        require(msg.value == fee, "Incorrect fee");
        subscriptions[msg.sender] = block.timestamp + 30 days;
    }

    function isSubscribed() public view returns (bool) {
        return block.timestamp < subscriptions[msg.sender];
    }
}
