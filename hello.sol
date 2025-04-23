// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Helloworld{
    // declare the variable saying hello world
    string public sayHelloWorld = 'Hello World';
    // now return this variable
    function getValue() public view returns (string memory){
        return sayHelloWorld;
    }
}
