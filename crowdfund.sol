// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IERC20 {
 function transferFrom(address from, address to, uint value) external returns (bool);
 function transfer(address to, uint value) external returns (bool);
}
contract CrowdFund {
 struct Campaign {
 address creator;
 uint goal;
 uint pledged;
 uint32 startAt;
 uint32 endAt;
 bool claimed;
 }
 IERC20 public immutable token;
 uint public count;
 mapping(uint => Campaign) public campaigns;
 mapping(uint => mapping(address => uint)) public pledgedAmount;
 constructor(address _token) {
 token = IERC20(_token);
 }
 function createCampaign(uint _goal, uint32 _duration) external {
 require(_duration <= 90 days, "Too long");
 count += 1;
 campaigns[count] = Campaign({
 creator: msg.sender,
 goal: _goal,
 pledged: 0,
 startAt: uint32(block.timestamp),
 endAt: uint32(block.timestamp + _duration),
 claimed: false
 });
 }
 function pledge(uint _id, uint _amount) external {
Campaign storage campaign = campaigns[_id];
 require(block.timestamp >= campaign.startAt, "Not started");
 require(block.timestamp <= campaign.endAt, "Ended");
 campaign.pledged += _amount;
 pledgedAmount[_id][msg.sender] += _amount;
 token.transferFrom(msg.sender, address(this), _amount);
 }
 function claim(uint _id) external {
 Campaign storage campaign = campaigns[_id];
 require(msg.sender == campaign.creator, "Not creator");
 require(block.timestamp > campaign.endAt, "Not ended");
 require(campaign.pledged >= campaign.goal, "Goal not met");
 require(!campaign.claimed, "Already claimed");
 campaign.claimed = true;
 token.transfer(campaign.creator, campaign.pledged);
 }
 function refund(uint _id) external {
 Campaign storage campaign = campaigns[_id];
 require(block.timestamp > campaign.endAt, "Not ended");
 require(campaign.pledged < campaign.goal, "Goal met");
 uint bal = pledgedAmount[_id][msg.sender];
 pledgedAmount[_id][msg.sender] = 0;
 token.transfer(msg.sender, bal);
 }
}
