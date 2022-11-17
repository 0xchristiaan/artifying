const hre = require("hardhat");

async function main() {
  const fauna2 = await hre.ethers.getContractFactory("Fauna2");
  const fauna2Deploy = await Lock.deploy(fauna2);

  await fauna2Deploy.deployed();

  console.log(
    `Fauna2 deployed to ${fauna2Deploy.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
