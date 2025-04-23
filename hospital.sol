// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalDataVault {
    struct Record {
        string ipfsHash;
        address uploader;
        address patient;
    }

    uint public recordCount;
    mapping(uint => Record) public records;

    event RecordUploaded(uint id, address indexed uploader, address indexed patient);

    // Function to upload a new medical record
    function uploadRecord(string memory _ipfsHash, address _patient) public {
        require(bytes(_ipfsHash).length > 0, "IPFS hash is required");
        require(_patient != address(0), "Valid patient address required");

        recordCount++;
        records[recordCount] = Record(_ipfsHash, msg.sender, _patient);
        emit RecordUploaded(recordCount, msg.sender, _patient);
    }

    // Function to retrieve a record by ID (only the patient can view)
    function getRecord(uint _id) public view returns (string memory, address, address) {
        require(_id > 0 && _id <= recordCount, "Record does not exist");
        Record memory record = records[_id];
        require(msg.sender == record.patient, "Access denied");

        return (record.ipfsHash, record.uploader, record.patient);
    }
}
