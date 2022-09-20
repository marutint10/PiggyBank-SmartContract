const main = async () => {
  const PiggyBank = await hre.ethers.getContractFactory("PiggyBank");
  const piggybank = await PiggyBank.deploy();

  await piggybank.deployed();

  console.log("PiggyBank address: ", piggybank.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
