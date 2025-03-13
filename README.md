# Music NFT Platform

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Ruby](https://img.shields.io/badge/Ruby-3.2.0-red.svg)
![Rails](https://img.shields.io/badge/Rails-7.0.4-red.svg)
![Solana](https://img.shields.io/badge/Solana-1.10.41-purple.svg)

## Overview

This is a demonstration project showcasing advanced web development skills with Ruby on Rails, Hotwire, Tailwind CSS, and Solana blockchain integration. This platform enables musicians to tokenize their albums as NFTs and establish new revenue streams through primary sales and secondary market royalties.

## 🚀 Features

### For Artists
- **Profile Creation**: Build your digital presence with customizable artist profiles
- **Album Tokenization**: Mint existing albums as NFTs with detailed metadata
- **Royalty Configuration**: Set and receive customizable royalty percentages on secondary sales
- **Analytics Dashboard**: Track sales, royalties, and fan engagement metrics

### For Collectors
- **Solana Wallet Integration**: Seamless connection with Phantom, Solflare, and other Solana wallets
- **Collection Management**: Browse, purchase, and manage your NFT music collection
- **Playback Integration**: Listen to owned music directly through the platform
- **Secondary Marketplace**: Trade NFTs with automatic royalty distribution to artists

## 🛠️ Technology Stack

### Backend
- **Ruby on Rails 7**: Server-side framework with API capabilities
- **PostgreSQL**: Relational database for user and application data
- **Redis**: In-memory data structure store for caching and background jobs
- **Sidekiq**: Background job processing for blockchain transactions
- **RSpec**: Comprehensive test suite for reliability

### Frontend
- **Hotwire (Turbo + Stimulus)**: Modern, responsive frontend with minimal JavaScript
- **Tailwind CSS**: Utility-first CSS framework for custom design
- **ViewComponent**: Reusable, testable view components
- **esbuild**: JavaScript bundler

### Blockchain
- **Solana Blockchain**: High-performance blockchain for NFT minting and trading
- **Metaplex**: NFT standard implementation for music assets
- **Arweave**: Permanent, decentralized storage for album content

## 🚀 Getting Started

### Prerequisites
- Ruby 3.2.0+
- Rails 7.0.4+
- PostgreSQL 14+
- Node.js 16+
- Yarn 1.22+
- Solana CLI tools (for development)

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/musicchain.git
cd musicchain

# Install dependencies
bundle install
yarn install

# Setup database
rails db:create db:migrate db:seed

# Start the development server
bin/dev
```

Visit `http://localhost:3000` to view the application.

## 📝 Smart Contract Documentation

The platform utilizes custom Solana smart contracts for NFT minting and royalty distribution. Contract implementations can be found in the `/contracts` directory with detailed documentation.

Key contract functionality includes:
- Metadata standard following Metaplex specifications
- Royalty enforcement on all marketplace transactions
- Verifiable ownership with on-chain provenance

## 🧪 Testing

```bash
# Run the full test suite
bundle exec rspec

# Run frontend tests
yarn test
```

## 🌐 Deployment

Deployment instructions for various environments (staging, production) can be found in [DEPLOYMENT.md](DEPLOYMENT.md).

## 📊 Project Architecture

The application follows a modular architecture:
- **Core**: User authentication, profiles, and base functionality
- **NFT Engine**: Smart contract integration and NFT operations
- **Marketplace**: Secondary market for buying and selling NFTs
- **Player**: Music playback and streaming integration

## 📚 Learning Resources

This project demonstrates several modern web development concepts:
- Server-driven UI with minimal JavaScript using Hotwire
- Blockchain integration in traditional web applications
- Responsive design with utility-first CSS
- Background job processing for blockchain transactions


## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 About the Developer

This portfolio project demonstrates advanced web development capabilities including:
- Full-stack development with Ruby on Rails
- Modern frontend techniques with minimal JavaScript
- Blockchain integration for real-world applications
- User-centered design and experience

