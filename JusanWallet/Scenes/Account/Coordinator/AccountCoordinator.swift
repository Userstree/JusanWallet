//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit


class AccountCoordinator: AccountBaseCoordinator {
    var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: MainBaseCoordinator?

    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: AccountViewController(coordinator: self))
        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String: Any]?) {
        switch flow {
        case .account(let screen):
            handleAccountFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }

    private func handleAccountFlow(for screen: AccountScreen, userData: [String: Any]?) {
        switch screen {
        case .initialScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        }
    }

    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
