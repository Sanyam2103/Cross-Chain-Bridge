const { hre, network, ethers } = require("hardhat");

module.exports = async function ({ getNamedAccounts, deployments }) {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;
  args = [];
  if (network == sepolia_testnet) {
    const tokenEth = await deploy("TokenETH", {
      from: deployer,
      args: args,
      log: true,
      waitConfirmations: network.config.blockConfirmations || 1,
    });
    await tokenEth.mint(addresses[0], 1000);

    args = [tokenEth.address];
    const bridgeEth = await deploy("BridgeETH", {
      from: deployer,
      args: args,
      log: true,
      waitConfirmations: network.config.blockConfirmations || 1,
    });
    await tokenEth.updateAdmin(bridgeEth.address);
  }
  if (network == bsc_testnet) {
    const tokenBsc = await deploy("TokenBSC", {
      from: deployer,
      args: args,
      log: true,
      waitConfirmations: network.config.blockConfirmations || 1,
    });

    args = [tokenBsc.address];
    const bridgeBsc = await deploy("BridgeBSC", {
      from: deployer,
      args: args,
      log: true,
      waitConfirmations: network.config.blockConfirmations || 1,
    });
    await tokenBsc.updateAdmin(bridgeBsc.address);
  }
};
