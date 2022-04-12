import "@nomiclabs/hardhat-ethers"
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers"
import { expect } from "chai"
import { ethers } from "hardhat"
import { ConfigurableToken, ConfigurableToken__factory } from "../typechain"

describe("ConfigurableToken", () => {
  let configurableToken: ConfigurableToken
  let deployer: SignerWithAddress

  beforeEach(async () => {
    deployer = (await ethers.getSigners())[0]
    configurableToken = await new ConfigurableToken__factory(deployer).deploy(
      "https://test"
    )
    await configurableToken.deployed()
  })

  it("deploys", () => {
    expect(configurableToken.address).to.exist
  })
})
