// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WarrantyManager {
    struct Product {
        uint purchaseDate;
        uint warrantyPeriod; // in days
    }

    mapping(uint => Product) public products;

    function registerProduct(uint id, uint _warrantyDays) public {
        products[id] = Product(block.timestamp, _warrantyDays);
    }

    function isValid(uint id) public view returns (bool) {
        Product memory p = products[id];
        return block.timestamp <= p.purchaseDate + (p.warrantyPeriod * 1 days);
    }
}
