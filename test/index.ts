import { expect } from "chai";
import { ethers } from "hardhat";

describe("Token contract VBI Hero", function () {
  let VBIHero;
  let heroContract: any;
  let owner: any;
  let addr1;
  let addr2;
  let addrs;

  beforeEach(async function () {
    VBIHero = await ethers.getContractFactory("VBIHero");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    heroContract = await VBIHero.deploy();
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await heroContract.owner()).to.equal(owner.address);
    });
  });

  describe("Mint NFT", function () {
    it("Should mint nft", async function () {
      await heroContract.mintHero("leo pham");
      const tokenCount = await heroContract.getTokenCount();
      expect(tokenCount).to.equal(1);
      expect(await heroContract.ownerOf(1)).to.equal(owner.address);
    });
    // it("Should fail if mint exist uri", async function () {
    //   await expect(heroContract.mintHero("leo pham")).to.be.revertedWith(
    //     "URI exist"
    //   );
    // });
  });
});
