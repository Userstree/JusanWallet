//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var expensesCoordinator: ExpensesBaseCoordinator = ExpensesCoordinator()
    lazy var paymentsCoordinator: PaymentsBaseCoordinator = PaymentsCoordinator()
    lazy var accountCoordinator: AccountBaseCoordinator = AccountCoordinator()
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)

    private var tabBarController: UITabBarController = {
        let tabController = UITabBarController()
        tabController.tabBar.backgroundColor = .primaryDarkColor
        tabController.tabBar.tintColor = .secondaryColor
        tabController.tabBar.unselectedItemTintColor = .systemGray2
        return tabController
    }()

    lazy var rootViewController: UIViewController = tabBarController

    func start() -> UIViewController {

        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(
                title: "Home",
                image: UIImage(systemName: "house"),
                tag: 0
        )

        let expensesViewController = expensesCoordinator.start()
        expensesCoordinator.parentCoordinator = self
        expensesViewController.tabBarItem = UITabBarItem(title: "Expenses", image: UIImage(systemName: "clock.arrow.circlepath"), tag: 1)

        let paymentsViewController = paymentsCoordinator.start()
        paymentsCoordinator.parentCoordinator = self
        paymentsViewController.tabBarItem = UITabBarItem(title: "Payments", image: UIImage(systemName: "arrow.left.arrow.right"), tag: 2)

        let accountViewController = accountCoordinator.start()
        accountCoordinator.parentCoordinator = self
        accountViewController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person"), tag: 3)

        let tabBarControllers = [homeViewController, expensesViewController, paymentsViewController, accountViewController]
        (rootViewController as? UITabBarController)?.setViewControllers(tabBarControllers, animated: true)
        return rootViewController
    }

    func moveTo(flow: AppFlow, userData: [String: Any]?) {
        switch flow {
        case .home:
            goToHomeFlow(flow)
        case .expenses:
            goToExpenses(flow)
        case .automaticPayments:
            goToAutoPayments(flow)
        case .account:
            goToAccount(flow)
        }
    }

    private func goToHomeFlow(_ flow: AppFlow) {
        homeCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }

    private func goToExpenses(_ flow: AppFlow) {
        expensesCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 1
    }

    private func goToAutoPayments(_ flow: AppFlow) {
        paymentsCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 2
    }

    private func goToAccount(_ flow: AppFlow) {
        paymentsCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 3
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
