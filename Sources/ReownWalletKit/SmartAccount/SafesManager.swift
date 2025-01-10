
import Foundation
import YttriumWrapper

class SafesManager {
    var ownerToClient: [Account: FfiAccountClient] = [:]
    let apiKey: String

    init(pimlicoApiKey: String) {
        self.apiKey = pimlicoApiKey
    }

    func getOrCreateSafe(for owner: Account) -> FfiAccountClient {
        if let client = ownerToClient[owner] {
            return client
        } else {
            // to do check if chain is supported
            let safe = createSafe(ownerAccount: owner)
            ownerToClient[owner] = safe
            return safe
        }
    }

    private func createSafe(ownerAccount: Account) -> FfiAccountClient {
        let chainId = ownerAccount.reference
        let projectId = Networking.projectId
        let pimlicoBundlerUrl = "https://api.pimlico.io/v2/\(chainId)/rpc?apikey=\(apiKey)"
        let rpcUrl = "https://rpc.walletconnect.com/v1?chainId=\(ownerAccount.blockchainIdentifier)&projectId=\(projectId)"

        let pimlicoSepolia = Config(endpoints: .init(
            rpc: .init(baseUrl: rpcUrl, apiKey: ""),
            bundler: .init(baseUrl: pimlicoBundlerUrl, apiKey: ""),
            paymaster: .init(baseUrl: pimlicoBundlerUrl, apiKey: "")
        ))
        // use YttriumWrapper.Config.local() for local foundry node

//        let FfiAccountClientConfig = FfiAccountClientConfig(
//            ownerAddress: ownerAccount.address,
//            chainId: UInt64(ownerAccount.blockchain.reference)!,
//            config: pimlicoSepolia,
//            signerType: "PrivateKey",
//            safe: true,
//            privateKey: "ff89825a799afce0d5deaa079cdde227072ec3f62973951683ac8cc033092156")

        let client = FfiAccountClient(owner: ownerAccount.address, chainId: UInt64(ownerAccount.blockchain.reference)!, config: pimlicoSepolia)
//         FfiAccountClient(config: FfiAccountClientConfig)


        return client
    }
}
