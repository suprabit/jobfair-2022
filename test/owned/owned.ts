import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { Contract } from "ethers";
import { ethers } from "hardhat";

describe("[Challenge] Owned", function () {
  let deployer: SignerWithAddress;
  let user: SignerWithAddress;

  let owned: Contract;

  before(async function () {
    [deployer, user] = await ethers.getSigners();

    const OwnedFactory = await ethers.getContractFactory("Owned", deployer);
    owned = await OwnedFactory.deploy();
  });

  it("Doesn't update ownership if caller is not owner", async function () {
    await expect(owned.connect(user).setOwner(user.address)).to.be.reverted;
  });

  it("Updates ownership if owner is caller", async function () {
    await expect(owned.setOwner(user.address)).to.not.be.reverted;
    expect(await owned.owner()).to.equal(user.address);
  });
});
