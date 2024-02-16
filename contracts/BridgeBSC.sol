//SPDX-License-Identifer:MIT
pragma solidity ^0.8.20;
import "./Bridge.sol";

contract BridgeBSC is Bridge {
  constructor(address tokenBSC) Bridge(tokenBSC) {}
}
