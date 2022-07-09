//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    var finishFlow: (() -> Void)?

    private let factory: AuthModuleFactory
    private let router: Router
    private weak var signUpView: SignUpView?

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
        signUpView = factory.makeSignUpHandler()
        signUpView?.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        signUpView?.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signUpView)
    }
}
