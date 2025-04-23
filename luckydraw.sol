// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyDraw {
    address[] public players;
    address public winner;

    function enterDraw() public payable {
        require(msg.value == 0.01 ether, "Entry fee is 0.01 ETH");
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(players.length > 0, "No players");
        uint index = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % players.length;
        winner = players[index];
        payable(winner).transfer(address(this).balance);
        delete players;
    }
}
