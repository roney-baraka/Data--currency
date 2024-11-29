// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Stablecoin is ERC20, Ownable {
    address public oracle;

    // Constructor to initialize token name and symbol
    constructor() ERC20("Stablecoin", "STC") {}

    // Set oracle address (only owner can do this)
    function setOracle(address _oracle) external onlyOwner {
        oracle = _oracle;
    }

    // Mint stablecoins (only oracle or owner can mint)
    function mint(address to, uint256 amount) external {
        require(msg.sender == owner() || msg.sender == oracle, "Not authorized");
        _mint(to, amount);
    }

    // Burn stablecoins
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
