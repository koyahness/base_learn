// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GarageManager {
    
    // Custom error for invalid car index
    error BadCarIndex(uint256 index);
    
    // Car struct with required properties
    struct Car {
        string make;
        string model;
        string color;
        uint256 numberOfDoors;
    }
    
    // Public mapping to store cars by owner address
    mapping(address => Car[]) public garage;
    
    // Add a car to the sender's garage
    function addCar(
        string memory _make,
        string memory _model,
        string memory _color,
        uint256 _numberOfDoors
    ) public {
        Car memory newCar = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });
        
        garage[msg.sender].push(newCar);
    }
    
    // Get all cars owned by the calling user
    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }
    
    // Get all cars for any given address
    function getUserCars(address _user) public view returns (Car[] memory) {
        return garage[_user];
    }
    
    // Update a car at specific index for the sender
    function updateCar(
        uint256 _index,
        string memory _make,
        string memory _model,
        string memory _color,
        uint256 _numberOfDoors
    ) public {
        // Check if sender has a car at that index
        if (_index >= garage[msg.sender].length) {
            revert BadCarIndex(_index);
        }
        
        // Update the car properties
        garage[msg.sender][_index] = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });
    }
    
    // Reset the sender's garage (delete all cars)
    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}
