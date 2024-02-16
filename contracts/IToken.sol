pragma solidity ^0.8.20;

interface IToken {
    function mint(address _to, uint256 amount) external {}

    function burn(address _owner, uint256 amount) external {}
}
