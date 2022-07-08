//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
    case main, auth, onboarding

    static func configure(
            tutorialWasShown: Bool = onboardingWasShown,
            isAutorized: Bool = isAutorized) -> LaunchInstructor {

        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}


class AppCoordinator: BaseCoordinator {


    private let coordinatorFactory: CoordinatorFactory
    private let router: Router

    private var instructor: LaunchInstructor {
        LaunchInstructor.configure()
    }

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .onboarding: runOnboardingFlow()
            case .signUp: runAuthFlow()
            default: childCoordinators.forEach { coordinator in
                coordinator.start(with: option)
            }
            }
        } else {
            switch instructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }

//    private func runAuthFlow() {
//        let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            isAutorized = true
//            self?.start()
//            self?.removeDependency(coordinator)
//        }
//        addChildCoordinator(coordinator)
//        coordinator.start()
//    }
//
//    private func runOnboardingFlow() {
//        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            onboardingWasShown = true
//            self?.start()
//            self?.removeChildCoordinator(coordinator)
//        }
//        addChildCoordinator(coordinator)
//        coordinator.start()
//    }
//
//    private func runMainFlow() {
//        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
//        addChildCoordinator(coordinator)
//        router.setRootModule(module, hideBar: true)
//        coordinator.start()
//    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()

            showLoginFlow()
        case .login:
            navigationController.viewControllers.removeAll()

            showMainFlow()
        default:
            break
        }
    }
}