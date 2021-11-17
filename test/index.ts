import { expect } from "chai";
import { ethers } from "hardhat";

describe("VBIHero", function () {
  it("Should return the new greeting once it's changed", async function () {
    const VBIHero = await ethers.getContractFactory("VBIHero");
    const hero = await VBIHero.deploy();
    await hero.deployed();

    await hero.mintHero("leo pham");
    console.log(await hero.tokenURI(1));
  });
});
