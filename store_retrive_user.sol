// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UsernameStorage {
    mapping(address => string) private usernames;

    function setUsername(string memory _username) public {
        usernames[msg.sender] = _username;
    }

    function getUsername() public view returns (string memory) {
        return usernames[msg.sender];
    }
}
