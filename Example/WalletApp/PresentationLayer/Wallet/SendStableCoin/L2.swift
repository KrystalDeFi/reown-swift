import ReownWalletKit

/// Example L2 enumerations
enum L2: String {
    case Arbitrium
    case Optimism
    case Base

    /// The chain ID in "eip155:<number>" format
    var chainId: Blockchain {
        switch self {
        case .Arbitrium:
            return Blockchain("eip155:42161")!
        case .Optimism:
            return Blockchain("eip155:10")!
        case .Base:
            return Blockchain("eip155:8453")!
        }
    }

    /// USDC contract address for each network
    var usdcContractAddress: String {
        switch self {
        case .Arbitrium:
            // Arbitrum USDC
            return "0xaf88d065e77c8cC2239327C5EDb3A432268e5831"
        case .Optimism:
            return "0x0b2c639c533813f4aa9d7837caf62653d097ff85"
        case .Base:
            return "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913"
        }
    }

    /// USDT contract address for each network
    var usdtContractAddress: String {
        switch self {
        case .Arbitrium:
            return "0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9"
        case .Optimism:
            return "0x94b008aA00579c1307B0EF2c499aD98a8ce58e58"
        case .Base:
            return "0xfde4C96c8593536E31F229EA8f37b2ADa2699bb2"
        }
    }
    
    /// USDS contract address for each network
    var usdsContractAddress: String {
        switch self {
        case .Arbitrium:
            return "0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1"
        case .Optimism:
            return "0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1"
        case .Base:
            // Not supported on Base
            return ""
        }
    }
}
