//SPDX-License-Identifer:MIT

pragma solidity ^0.8.20;

import "./IToken.sol";

contract Bridge {
    address public admin;
    IToken public token;
    uint256 nonce;
    mapping(nonce => bool) nonceStatus;

    constructor(address _token) {
        admin = msg.sender;
        token = IToken(_token);
    }

    enum Step {
        burn,
        mint
    }

    event Transfer(
        address from,
        address to,
        uint256 amount,
        uint256 date,
        uint256 nonce,
        Step indexed step
    );

    function burn(address to, uint256 amount) external {
        token.burn(msg.sender, amount);
        emit Transfer(
            msg.sender,
            to,
            amount,
            block.timestamp,
            nonce,
            Step.burn
        );
        nonce++;
    }

    function mint(
        address to,
        uint256 amount,
        uint256 otherChainNonce
    ) external {
        require(admin == msg.sender, "notowner");
        require(nonceStatus[otherChainNonce] == false, "already processed");
        token.mint(to, amount);
        nonceStatus[otherChainNonce] = true;
        emit Transfer(
            msg.sender,
            to,
            amount,
            block.timestamp,
            otherChainNonce,
            Step.mint
        );
    }
}
