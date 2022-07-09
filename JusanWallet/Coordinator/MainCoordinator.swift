//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit



class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)

    lazy var rootViewController: UIViewController = UITabBarController()

    func start() -> UIViewController {

        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)

        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController]

        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String: Any]?) {
        switch flow {
        case .home:
            goToHomeFlow(flow)
        }
    }

    private func goToHomeFlow(_ flow: AppFlow) {
        homeCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }

    func handleDeepLink(text: String) {
        deepLinkCoordinator.handleDeeplink(deepLink: text)
    }

    func resetToRoot() -> Self {
        homeCoordinator.resetToRoot(animated: false)
        moveTo(flow: .home(.initialScreen), userData: nil)
        return self
    }
}
