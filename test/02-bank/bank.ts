import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { Bank, BankAttacker } from "../../typechain";

describe("[Challenge] Receiver", function () {
  let deployer: SignerWithAddress;
  let user: SignerWithAddress;

  let bank: Bank;
  let bankAttacker: BankAttacker;

  before(async function () {
    [deployer, user] = await ethers.getSigners();

    const tokenFactory = await ethers.getContractFactory("Token");
    const token = await tokenFactory.deploy();

    const BankFactory = await ethers.getContractFactory("Bank");
    bank = await BankFactory.deploy();
    await bank.connect(user).deposit({ value: ethers.utils.parseEther("5") });

    const BankAttackerFactory = await ethers.getContractFactory(
      "BankAttacker",
      deployer
    );
    bankAttacker = await BankAttackerFactory.deploy(bank.address);

    await deployer.sendTransaction({
      from: deployer.address,
      to: bankAttacker.address,
      value: 1,
    });
  });

  it("Runs the solution", async function () {
    await expect(bankAttacker.attack()).to.not.be.reverted;
  });
});
