require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-waffle");
require("hardhat-deploy-ethers");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-deploy");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */

//const COINMARKETCAP_API_KEY = process.env.COINMARKETCAP_API_KEY || "";
const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY;
const SEPOLIA_RPC_URL =
  process.env.SEPOLIA_RPC_URL ||
  `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
//const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;
//const RPC_URL = process.env.RPC_URL;

module.exports = {
  networks: {
    sepolia_testnet: {
      url: SEPOLIA_RPC_URL,
      chainId: 11155111,
      accounts: [PRIVATE_KEY],
      saveDeployments: true,
    },
    bsc_testnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
      chainId: 97,
      accounts: [PRIVATE_KEY],
      saveDeployments: true,
    },
  },
  solidity: "0.8.19",
};
