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
    lazy var analyticsCoordinator: AnalyticsBaseCoordinator = AnalyticsCoordinator()
    lazy var paymentsCoordinator: PaymentsBaseCoordinator = PaymentsCoordinator()
    lazy var plannerCoordinator: PlannerBaseCoordinator = PlannerCoordinator()
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)

    private lazy var tabBarController: BATabBarController = {
        let tabController = BATabBarController()
        tabController.tabBarAnimationDuration = 0.46
        tabController.delegate = self
        tabController.tabBarBackgroundColor = .primary
        tabController.tabBarItemStrokeColor = .primaryVariant
        return tabController
    }()

    lazy var rootViewController: UIViewController = tabBarController

    func start() -> UIViewController {

        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        let homeAttributedTitle = NSMutableAttributedString(string: "Home")
        let homeImage = UIImage(named: "homeIcon")!
        let homeItem = BATabBarItem(image: homeImage, selectedImage: homeImage, title: homeAttributedTitle)
        homeItem.title?.textColor = .onPrimary
        homeViewController.tabBarController(tabBarController, didSelect: homeViewController)


        let analyticsViewController = analyticsCoordinator.start()
        analyticsCoordinator.parentCoordinator = self
        let analyticsTitle = NSMutableAttributedString(string: "Analytics")
        let analyticsImage = UIImage(named: "expensesIcon")!
        let analyticsItem = BATabBarItem(image: analyticsImage, selectedImage: analyticsImage, title: analyticsTitle)
        analyticsItem.title?.textColor = .onPrimary
        analyticsViewController.tabBarController(tabBarController, didSelect: analyticsViewController)


        let plannerViewController = plannerCoordinator.start()
        plannerCoordinator.parentCoordinator = self
        let plannerTitle = NSMutableAttributedString(string: "Planner")
        let plannerImage = UIImage(named: "planner28")!
        let plannerItem = BATabBarItem(image: plannerImage, selectedImage: plannerImage, title: plannerTitle)
        plannerItem.title?.textColor = .onPrimary
        plannerViewController.tabBarController(tabBarController, didSelect: plannerViewController)


        let paymentsViewController = paymentsCoordinator.start()
        paymentsCoordinator.parentCoordinator = self
        let paymentsTitle = NSMutableAttributedString(string: "Payments")
        let paymentsImage = UIImage(named: "paymentsIcon")!
        let paymentsItem = BATabBarItem(image: paymentsImage, selectedImage: paymentsImage, title: paymentsTitle)
        paymentsItem.title?.textColor = .onPrimary
        paymentsViewController.tabBarController(tabBarController, didSelect: paymentsViewController)


        let tabBarControllers = [homeViewController, analyticsViewController, plannerViewController, paymentsViewController]
        (rootViewController as? BATabBarController)?.tabBarItems = [homeItem, analyticsItem, plannerItem, paymentsItem]
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
        analyticsCoordinator.moveTo(flow: flow, userData: nil)
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
