//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit
import BATabBarController

extension UIViewController: BATabBarControllerDelegate {
    public func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {  }
}

class MainCoordinator: NSObject, MainBaseCoordinator, BATabBarControllerDelegate {

    var parentCoordinator: MainBaseCoordinator?

    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var expensesCoordinator: ExpensesBaseCoordinator = ExpensesCoordinator()
    lazy var paymentsCoordinator: PaymentsBaseCoordinator = PaymentsCoordinator()
    lazy var plannerCoordinator: PlannerBaseCoordinator = PlannerCoordinator()
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)

    private lazy var tabBarController: BATabBarController = {
//        let tabController = UITabBarController()
        let tab = BATabBarController()
        tab.delegate = self
        tab.tabBarBackgroundColor = .systemGray5
        tab.tabBarItemStrokeColor = .orange
//        tabController.tabBar.backgroundColor = .primaryDarkColor
//        tabController.tabBar.tintColor = .secondaryColor
//        tabController.tabBar.unselectedItemTintColor = .systemGray2
        return tab
    }()

    lazy var rootViewController: UIViewController = tabBarController

    func start() -> UIViewController {

        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        let homeTitle = NSMutableAttributedString(string: "Home")
        let homeImage = UIImage(named: "homeIcon")!
        let homeItem = BATabBarItem(image: homeImage, selectedImage: homeImage, title: homeTitle)
        homeViewController.tabBarController(tabBarController, didSelect: homeViewController)//UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)


        let expensesViewController = expensesCoordinator.start()
        expensesCoordinator.parentCoordinator = self
        let expensesTitle = NSMutableAttributedString(string: "Expenses")
        let expensesImage = UIImage(named: "expensesIcon")!
        let expensesItem = BATabBarItem(image: expensesImage, selectedImage: expensesImage, title: expensesTitle)
        expensesViewController.tabBarController(tabBarController, didSelect: expensesViewController) //UITabBarItem(title: "Expenses", image: UIImage(systemName: "dollarsign.circle.fill"), tag: 1)


        let plannerViewController = plannerCoordinator.start()
        plannerCoordinator.parentCoordinator = self
        let plannerTitle = NSMutableAttributedString(string: "Planner")
        let plannerImage = UIImage(named: "planner28")!
        let plannerItem = BATabBarItem(image: plannerImage, selectedImage: plannerImage, title: plannerTitle)
        plannerViewController.tabBarController(tabBarController, didSelect: plannerViewController)//UITabBarItem(title: "Planner", image: UIImage(systemName: "calendar.badge.plus"), tag: 2)


        let paymentsViewController = paymentsCoordinator.start()
        paymentsCoordinator.parentCoordinator = self
        let paymentsTitle = NSMutableAttributedString(string: "Payments")
        let paymentsImage = UIImage(named: "paymentsIcon")!
        let paymentsItem = BATabBarItem(image: paymentsImage, selectedImage: paymentsImage, title: paymentsTitle)
        paymentsViewController.tabBarController(tabBarController, didSelect: paymentsViewController)//UITabBarItem(title: "Payments", image: UIImage(systemName: "arrow.triangle.2.circlepath.circle"), tag: 3)


        let tabBarControllers = [homeViewController, expensesViewController, plannerViewController, paymentsViewController]
//        (rootViewController as? BATabBarController)?.setViewControllers(tabBarControllers, animated: true)
//        (rootViewController as? BATabBarController)?.selectedIndex = 1
        (rootViewController as? BATabBarController)?.tabBarItems = [homeItem, expensesItem, plannerItem, paymentsItem]
        (rootViewController as? BATabBarController)?.initialViewController = tabBarControllers[1]
        (rootViewController as? BATabBarController)?.viewControllers = tabBarControllers
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

    func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {
    }
}
