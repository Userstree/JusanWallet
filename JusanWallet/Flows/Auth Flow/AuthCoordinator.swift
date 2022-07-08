//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

final class AuthCoordinator: BaseCoordinator {
    var finishFlow: (() -> Void)?

    private let factory: AuthModuleFactory
    private let router: Router

    init(factory: AuthModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }

    override func start() {
        showLogin()
    }

    private func showLogin() {
        let loginOutput = factory.makeLoginOutput()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(loginOutput)
    }

    private func showSignUp() {

    }
}
