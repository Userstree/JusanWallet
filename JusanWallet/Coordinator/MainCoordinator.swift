//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?

    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var expensesCoordinator: ExpensesBaseCoordinator = ExpensesCoordinator()
    lazy var paymentsCoordinator: PaymentsBaseCoordinator = PaymentsCoordinator()
    lazy var plannerCoordinator: PlannerBaseCoordinator = PlannerCoordinator()
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
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        let expensesViewController = expensesCoordinator.start()
        expensesCoordinator.parentCoordinator = self
        expensesViewController.tabBarItem = UITabBarItem(title: "Expenses", image: UIImage(systemName: "dollarsign.circle.fill"), tag: 1)


        let plannerViewController = plannerCoordinator.start()
        plannerCoordinator.parentCoordinator = self
        plannerViewController.tabBarItem = UITabBarItem(title: "Planner", image: UIImage(systemName: "calendar.badge.plus"), tag: 2)

        let paymentsViewController = paymentsCoordinator.start()
        paymentsCoordinator.parentCoordinator = self
        paymentsViewController.tabBarItem = UITabBarItem(title: "Payments", image: UIImage(systemName: "arrow.triangle.2.circlepath.circle"), tag: 3)

        let tabBarControllers = [homeViewController, expensesViewController, plannerViewController, paymentsViewController]
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
        case .planner:
            goToPlanner(flow)
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

    private func goToPlanner(_ flow: AppFlow) {
        paymentsCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 2
    }

    private func goToAutoPayments(_ flow: AppFlow) {
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
