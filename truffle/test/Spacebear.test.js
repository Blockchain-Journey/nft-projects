const Spacebear = artifacts.require("Spacebear");
const truffleAssertions = require("truffle-assertions");

contract("Spacebear", (accounts) => {
  it("should credit an NFT to a specific account", async () => {
    const SpacebearInstance = await Spacebear.deployed();
    const _mintResponds = await SpacebearInstance.safeMint(
      accounts[1],
      "spacebear_1.json"
    );
    // console.log(await SpacebearInstance.ownerOf(0));
    // console.log(_mintResponds, ":mintResponds");
    // assert.equal(
    //   _mintResponds.logs[0].event,
    //   "Transfer",
    //   "Transfer event not emitted"
    // );
    // assert.equal(
    //   _mintResponds.logs[0].args.from,
    //   "0x0000000000000000000000000000000000000000",
    //   "Transfer event from not emitted"
    // );

    console.log(_mintResponds.logs[0].args, ":args");
    truffleAssertions.eventEmitted(_mintResponds, "Transfer", {
      from: "0x0000000000000000000000000000000000000000",
      to: accounts[1],
      tokenId: web3.utils.toBN("0"),
    });

    assert.equal(
      await SpacebearInstance.ownerOf(0),
      accounts[1],
      "Owner of token 1 is not equal to account 2"
    );
  });
});
