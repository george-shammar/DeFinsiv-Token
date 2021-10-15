// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract DeFinse is Ownable, ERC20, Pausable {

    /// @dev Declare authorized administrator
    address public governor;

    /// @notice is the contract address(DeFinsiv address) that is allowed to mint and burn token.
    address public controller;

    /// @notice An event that is emitted when the governor's address changes
    event GovernorChanged(address governor, address newGovernor);

    /// @notice Construct a new DES token

    constructor() ERC20('DeFinse', 'DES'){
        governor = msg.sender;
    }

    /**
    * @notice Change the governor address
    * @param _governor The address of the new governor
    */

    function setGovernor(address _governor) external {

    }
}