// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract RealEstateRegistry {
 struct Property {
 uint id;
 string location;
 uint price;
 address owner;
 }
 uint public propertyCount;
 mapping(uint => Property) public properties;
 event PropertyRegistered(uint id, address indexed owner);
 event OwnershipTransferred(uint id, address indexed newOwner);
 function registerProperty(string memory _location, uint _price) public {
 propertyCount++;
 properties[propertyCount] = Property(propertyCount, _location, _price, msg.sender);
 emit PropertyRegistered(propertyCount, msg.sender);
 }
  function transferOwnership(uint _id, address _newOwner) public {
 require(msg.sender == properties[_id].owner, "Unauthorized");
 properties[_id].owner = _newOwner;
 emit OwnershipTransferred(_id, _newOwner);
 }
 function getProperty(uint _id) public view returns (string memory, uint, address) {
 Property memory p = properties[_id];
 return (p.location, p.price, p.owner);
 }
}
