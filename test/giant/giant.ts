import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { Contract } from "ethers";
import { ethers } from "hardhat";
import { Solution } from "../../typechain";
import { Attacker } from "../../typechain/Attacker";
import { Giant } from "../../typechain/Giant";

describe("[Challenge] Receiver", function () {
  let deployer: SignerWithAddress;
  let user: SignerWithAddress;

  let giant: Giant;
  let solution: Solution;

  before(async function () {
    [deployer, user] = await ethers.getSigners();

    const GiantFactory = await ethers.getContractFactory("Giant");
    giant = await GiantFactory.deploy();

    const solutionFactory = await ethers.getContractFactory(
      "Solution",
      deployer
    );
    solution = await solutionFactory.deploy(giant.address);
  });

  it("Runs the solution", async function () {
    await expect(solution.run()).to.not.be.reverted;
  });

  after(async function () {
    expect(await giant.balanceOf(deployer.address)).to.equal(55);
  });
});
