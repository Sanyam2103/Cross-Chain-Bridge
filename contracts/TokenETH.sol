//SPDX-License-Identifer:MIT

pragma solidity ^0.8.20;
import "./Token.sol";

contract TokenA is Token {
    constructor() Token("TokenETH", "ETH");
}
