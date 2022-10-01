/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY;
const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;
const ETHERSCAN_KEY = process.env.ETHERSCAN_KEY;

const ALCHEMY_API_KEY_PROD = process.env.ALCHEMY_API_KEY_PROD;
const POLYGON_PRIVATE_KEY = process.env.POLYGON_PRIVATE_KEY;
const POLYSCAN_KEY = process.env.POLYSCAN_KEY;

module.exports = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [`${RINKEBY_PRIVATE_KEY}`]
    },
    polygon: {
      url: `https://polygon-mainnet.g.alchemy.com/v2/${ALCHEMY_API_KEY_PROD}`,
      accounts: [`${POLYGON_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: {
      rinkeby: `${ETHERSCAN_KEY}`,
      polygon: `${POLYSCAN_KEY}`
    }
  }
};
