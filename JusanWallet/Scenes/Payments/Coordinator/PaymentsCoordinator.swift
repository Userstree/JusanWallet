//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class PaymentsCoordinator: PaymentsBaseCoordinator {
    var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: MainBaseCoordinator?

    func start() -> UIViewController {
        let rootViewController = UINavigationController(rootViewController: PaymentsViewController(coordinator: self))
        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String: Any]?) {
        switch flow {
        case .automaticPayments(let screen):
            handlePaymentsFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }

    private func handlePaymentsFlow(for screen: AutomaticPayments, userData: [String: Any]?) {
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
