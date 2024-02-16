//SPDX-License-Identifer:MIT
pragma solidity ^0.8.20;
import "./Bridge.sol";

contract BridgeETH is Bridge {
  Bridge private bridge;

  constructor(address tokenEth) Bridge(tokenEth) {}
}
