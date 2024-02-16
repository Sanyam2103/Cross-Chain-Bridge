//SPDX-License-Identifer:MIT

pragma solidity ^0.8.20;
import "./Token.sol";

contract TokenB is Token {
    constructor() Token("TokenBNB", "BNB");
}
