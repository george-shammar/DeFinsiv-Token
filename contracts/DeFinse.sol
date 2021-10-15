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
        require(msg.sender == governor, "DES::setGovernor: Only the governor can change the governor address");
        governor = _governor;
        emit GovernorChanged(governor, _governor);
    }

    function setController(address _controller) external {
        require(msg.sender == governor, "DES::setController: Only the governor can set the controller contract address");
        controller = _controller;
    }

    /**
     * @notice Mint new tokens (DES)
     * @param amount The number of tokens to be minted
     */

    function mint(address _user, uint amount) public onlyController {
        _mint(_user, amount);
    }

    /// @notice Allows the controller to burn tokens from a user account
    /// @param _user Address of the holder account to burn tokens from
    /// @param _amount Amount of tokens to burn
        
    function burn(address _user, uint256 _amount) public onlyController {
        _burn(_user, _amount);
    }

    /// @dev Function modifier to ensure that the caller is the controller contract
}