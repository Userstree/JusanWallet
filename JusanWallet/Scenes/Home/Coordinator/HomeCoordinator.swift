//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class HomeCoordinator: HomeBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    lazy var rootViewController: UIViewController = UIViewController()

    func start() -> UIViewController {
        let controller = HomeViewController(coordinator: self)
        let categoriesService = MockCatalogService()
        let viewModel = HomeViewModelImpl(categoryService: categoriesService)
        controller.bind(to: viewModel)
        rootViewController = UINavigationController(rootViewController: controller)

        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .home(let screen):
            handleHomeFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }

    private func handleHomeFlow(for screen: HomeScreen, userData: [String: Any]?) {
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

