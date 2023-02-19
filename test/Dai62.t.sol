// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Dai46.sol";

contract Dai46Test is Test {
    Dai46 public dai46;

    function setUp() public {
        dai46 = new Dai46();

    }

}
