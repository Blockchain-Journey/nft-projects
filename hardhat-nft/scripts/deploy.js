(async () => {
  try {
    const Spacebear = await hre.ethers.getContractFactory("Spacebear");
    const spacebearInstance = await Spacebear.deploy();
    await spacebearInstance.waitForDeployment();

    console.log("Spacebear deployed to:", await spacebearInstance.getAddress());
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
})();
