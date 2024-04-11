require("@nomicfoundation/hardhat-toolbox");
const fs = require("fs");
const mnemonic = fs.readFileSync(".secret").toString().trim();
const infuraProjectID = fs.readFileSync(".infura").toString().trim();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    holesky: {
      url: `https://ethereum-holesky.publicnode.com`,
      accounts: {
        mnemonic,
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 10,
      },
    },
    goerli: {
      url: "https://goerli.infura.io/v3/" + infuraProjectID,
      accounts: {
        mnemonic,
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 10,
      },
    },
  },
  etherscan: {
    apiKey: fs.readFileSync(".etherscan").toString().trim(),
  },
  sourcify: {
    enabled: true,
  },
  solidity: "0.8.24",
};
