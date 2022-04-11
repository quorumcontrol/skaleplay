# Advanced Sample Hardhat Project

This project demonstrates an advanced Hardhat use case, integrating other tools commonly used alongside Hardhat in the ecosystem.

The project comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts. It also comes with a variety of other tools, preconfigured to work with the project code.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
REPORT_GAS=true npx hardhat test
npx hardhat coverage
npx hardhat run scripts/deploy.ts
TS_NODE_FILES=true npx ts-node scripts/deploy.ts
npx eslint '**/*.{js,ts}'
npx eslint '**/*.{js,ts}' --fix
npx prettier '**/*.{json,sol,md}' --check
npx prettier '**/*.{json,sol,md}' --write
npx solhint 'contracts/**/*.sol'
npx solhint 'contracts/**/*.sol' --fix
```

# Etherscan verification

To try out Etherscan verification, you first need to deploy a contract to an Ethereum network that's supported by Etherscan, such as Ropsten.

In this project, copy the .env.example file to a file named .env, and then edit it to fill in the details. Enter your Etherscan API key, your Ropsten node URL (eg from Alchemy), and the private key of the account which will send the deployment transaction. With a valid .env file in place, first deploy your contract:

```shell
hardhat run --network ropsten scripts/deploy.ts
```

Then, copy the deployment address and paste it in to replace `DEPLOYED_CONTRACT_ADDRESS` in this command:

```shell
npx hardhat verify --network ropsten DEPLOYED_CONTRACT_ADDRESS "Hello, Hardhat!"
```

# Performance optimizations

For faster runs of your tests and scripts, consider skipping ts-node's type checking by setting the environment variable `TS_NODE_TRANSPILE_ONLY` to `1` in hardhat's environment. For more details see [the documentation](https://hardhat.org/guides/typescript.html#performance-optimizations).


## SKALE EMAIL

Hey @tobowers, 
Sending over the v2 schain enviroment details

RPC Endpoints
https://testnet-proxy.skalenodes.com/v1/whispering-turais
wss://testnet-proxy.skalenodes.com/v1/ws/whispering-turais

Filestorage:  https://testnet-proxy.skalenodes.com/fs/whispering-turais

Chain ID: 132333505628089 | 0x785b4b9847b9

Block Explorer: https://whispering-turais.testnet-explorer.skalenodes.com/

- - - - - - - - - - - - - - - - - - - - - - - - - -
There is a lot of documentation on our dev portal, but here are three articles to get you started. Definitely take a look at the SKALE Chain owner documentation to get an understanding of the sFUEL and its use for cost-free transactions within the SKALE Network's.

Getting Started | Deploying on SKALE
https://docs.skale.network/develop/

SKALE Chain Owner | SKALE Chain Access Controls
https://docs.skale.network/develop/skale-chain-access-control

Using Remix
https://docs.skale.network/develop/using-remix

We don't usually enable the faucet, outside of hackathons, however, I have enabled it for this chain here for ease of testing: https://faucet.skale.network/. Please let me know when you start to integrate, and I can also provide the SKALE Chain owner account information. 
- - - - - - - - - - - - - - - - - - - - - - - - - -

Once ready for testing let me know and Ill send over the private key information to you via DM.

Skalenodes (https://whispering-turais.testnet-explorer.skalenodes.com/)
whispering-turais SKALE Explorer
BlockScout provides analytics data, API, and Smart Contract tools for the whispering-turais