const { ethers } = require("hardhat");

async function main() {
  const PrivateNFT = await ethers.getContractFactory("PERC721Sample");
  const privateNFT = await PrivateNFT.deploy();

  await privateNFT.deployed();

  console.log(`PrivateNFT was deployed to ${privateNFT.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
