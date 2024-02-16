//SPDX-License-Identifer:MIT

pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public admin;

    constructor(string memory token, string memory tk) ERC20(token, tk) {
        admin = msg.sender;
    }

    function updateAdmin(address newAdmin) external {
        require(msg.sender == admin, "only admin");
        admin = newAdmin;
    }

    function mint(address _to, uint256 amount) external {
        require(msg.sender == admin, "only admin");
        _mint(_to, amount);
    }

    function burn(address _owner, uint256 amount) external {
        require(msg.sender == admin, "only admin");
        _burn(_owner, amount);
    }
}
