import Foundation
import UIKit
import ReownWalletKit

final class SendStableCoinRouter {
    weak var viewController: UIViewController!

    private let app: Application

    init(app: Application) {
        self.app = app
    }

    func dismiss() {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.dismiss()
        }
    }

    func presentCATransaction(
        call: Call,
        from: String,
        chainId: Blockchain,
        importAccount: ImportAccount,
        uiFields: UiFields
    ) {
        CATransactionModule.create(app: app, sessionRequest: nil, importAccount: importAccount, call: call, from: from, chainId: chainId, uiFields: uiFields)
            .present(from: viewController)
    }

}
