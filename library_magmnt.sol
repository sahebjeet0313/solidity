// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibrarySystem {
    struct Book {
        string title;
        bool isBorrowed;
    }

    Book[] public books;

    function addBook(string memory _title) public {
        books.push(Book(_title, false));
    }

    function borrowBook(uint index) public {
        require(!books[index].isBorrowed, "Already borrowed");
        books[index].isBorrowed = true;
    }

    function returnBook(uint index) public {
        books[index].isBorrowed = false;
    }
}
