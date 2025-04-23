// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserIdentity {
    struct User{
        string name;
        uint age;
        string email;
        bool isActive;
    }
    mapping(address=>User)public users;

    function register(string memory _name,uint _age,string memory _email)public{
        users[msg.sender]= User(_name,_age,_email,true);
    }

    function getUser(address _user)public view returns(string memory,uint,string memory){
        require(users[_user].isActive,"Account does not exist");
        User memory u = users[_user];
        return(u.name,u.age,u.email);
    }

}
