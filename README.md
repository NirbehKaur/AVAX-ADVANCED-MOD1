## Description: Defi Empire, A Simple DeFI Kingdom Clone

This is Metacrafters Avax Advanced Module first's project. 

Set up your EVM subnet: You can use our guide and the Avalanche documentation to create a custom EVM subnet on the Avalanche network.

Define your native currency: You can set up your own native currency, which can be used as the in-game currency for your DeFi Kingdom clone.

Connect to Metamask: Connect you EVM Subnet to metamask, this can be done by following the steps laid out in our guide.

Deploy basic building blocks: You can use Solidity and Remix to deploy the basic building blocks of your game, such as smart contracts for battling, exploring, and trading. These contracts will define the game rules, such as liquidity pools, tokens, and more.

# Number Guessing Game with Token Rewards

This project implements a simple number guessing game on the Avalanche subnet EVM using Solidity. Players can guess a number between 1 and 10, and if correct, they receive 5 tokens as a reward. If they exhaust their attempts without guessing correctly, they incur a token penalty.

# Steps to create your own subnet EVM on avalanche
1. Install Avalanche CLI(currently on mac and linux only )on your OS. If you are windows user, then use WSL to install ubuntu on your local machine.  You can find installation instructions for the Avalanche CLI in the official documentation.

2. After installing Avalanche CLI,  you can create a new subnet by running the command avalanche subnet create mySubnet in your terminal. This will create a new subnet with the name "mySubnet" on your local machine.

3. When creating a new subnet, you will be prompted to select a subnet type. Choose the SubnetEVM option to create an EVM Subnet on your local machine and follow the steps in the image below:

4. avalanche subnet create mySubnet

Attempted to check if a new version is available, but couldn't find the currently running version information

Make sure to follow official instructions, or automatic updates won't be available for you

✔ Subnet-EVM

creating subnet mySubnet

Enter your subnet's ChainId. It can be any positive integer.
ChainId: eg 27031

Select a symbol for your subnet's native token

Token symbol: TEST

✔ Use latest version

✔ Low disk use    / Low Throughput    1.5 mil gas/s (C-Chain's setting)

✔ Airdrop 1 million tokens to the default address (do not use in production)

✔ No

5. After selecting the EVM Subnet option, you can deploy the subnet by running the command avalanche subnet deploy mySubnet and selecting to deploy your subnet on your local network. This will deploy your new EVM Subnet on your local machine.

6. Once your EVM Subnet is deployed, the console will display all the details about the subnet you just created. You can use this information to interact with the subnet and start building your smart-contract protocol.

## Connecting to Metamask:
After deploying your subnet, you will be able to see the browser extension connection details at the bottom of the console. These details can be used to connect your subnet to a wallet such as Metamask. It also includes a private key to access funds and interact with your blockchain.

By following these steps, you will be able to connect your subnet to Metamask and start interacting with your blockchain.

Open Metamask on your web browser.

Go to Networks > Add a network > Add a network manually.

Enter the details provided by the Avalanche CLI.

Click on "Save" to add the subnet to Metamask.

## Contracts

### GameToken.sol

This contract defines an ERC-20-like token named "The NumWarrior" (`TNWR`). It includes basic functionalities such as minting tokens and transferring tokens between addresses.

### NumberGuessingGame.sol

This contract interacts with `GameToken.sol` and implements the number guessing game logic:

- **Admin Functions:**
  - `generateSecretNumber`: Generates a secret number between 1 and 10 which players need to guess.
  - `resetAttempts`: Allows the admin to reset the number of attempts for a specific player.

- **Player Functions:**
  - `guessNumber`: Allows players to guess the secret number. Rewards tokens on correct guesses and penalizes for incorrect attempts.

### Usage

1. **Deploy Contracts:**
   - Deploy `GameToken.sol` first to get the token address.
   - Deploy `NumberGuessingGame.sol` with the token address as a parameter.

2. **Interact with the Game:**
   - Players can guess the secret number using the `guessNumber` function.
   - Admin can generate a new secret number or reset attempts using respective functions.

### Events

- `Guess`: Emitted on each guess attempt, indicating success and remaining attempts.
- `Reward`: Emitted when a player guesses correctly and receives tokens.
- `Penalty`: Emitted when a player exhausts all attempts without guessing correctly and incurs a token deduction.

### Requirements

- Solidity ^0.8.17
- Truffle or Remix for contract deployment and testing
- MetaMask or similar wallet for interacting with the game on Ethereum testnets or mainnet

### License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

### Developer

- **Name:** Nirbeh Kaur
- **GitHub:** https://github.com/NirbehKaur
