// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/interfaces/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

interface ChainLogLike {
    function getAddress(bytes32) external view returns (address);
}

interface PotLike {
    function join(uint256 wad) external;

    function exit(uint256 wad) external;
}

/// @title Dai46
/// @author adcv
contract Dai62 is ERC4626 {
    using Math for uint256;

    // ============================= Parameters

    /// @notice Fee paid by users withdrawing from the contract, initialized at 0
    uint64 public withdrawFee = 0;

    /// @notice The period in seconds over which locked profit is unlocked
    /// @dev If 0, it can open this contract up to sandwich attacks
    uint64 public vestingPeriod;

    // ============================= Variables

    /// @notice reference to the MakerDAO chainlog
    ChainLogLike public immutable changelog;

    /// @notice reference to the MakerDAO Pot contract
    PotLike public immutable pot;

    constructor(address chainlog_) {
        changelog = ChainLogLike(chainlog_);
        pot = PotLike(changelog.getAddress("MCD_POT"));
    }

    // ============================= View Functions
}
