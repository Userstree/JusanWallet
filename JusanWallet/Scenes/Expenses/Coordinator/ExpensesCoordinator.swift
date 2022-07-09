//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class ExpensesCoordinator: ExpensesBaseCoordinator {
    var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: MainBaseCoordinator?

    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: ExpensesViewController(coordinator: self))
        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .expenses(let screen):
            handleExpensesFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }

    private func handleExpensesFlow(for screen: ExpensesScreen, userData: [String: Any]?) {
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
