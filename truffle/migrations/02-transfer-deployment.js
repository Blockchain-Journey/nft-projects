const TransferMoney = artifacts.require("TransferMoney");

module.exports = function (deployer, network, accounts) {
  // console.log(network, accounts);
  deployer.deploy(TransferMoney);
};
