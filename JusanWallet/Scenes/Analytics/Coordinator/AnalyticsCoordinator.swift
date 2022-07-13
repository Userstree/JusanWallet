//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class AnalyticsCoordinator: AnalyticsBaseCoordinator {
    var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: MainBaseCoordinator?

    func start() -> UIViewController {
        let controller = AnalyticsParentViewController(coordinator: self)
        let categoriesService = MockCatalogService()
        let expensesViewModel = AnalyticsViewModelImpl(catalogService: categoriesService)
        controller.bind(to: expensesViewModel)
        rootViewController = UINavigationController(rootViewController: controller)
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
