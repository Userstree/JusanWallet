//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

enum CoordinatorType {
    case app, login, tab
}

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }

    var navigationController: UINavigationController { get set }

    var childCoordinators: [Coordinator] { get set }

    var type: CoordinatorType { get }

    func start()
    func start(with option: DeepLinkOption)

    func finish()

    func addChildCoordinator(_ coordinator: Coordinator)

    func removeChildCoordinator(_ coordinator: Coordinator)

    init(_ navigationController: UINavigationController)
}

extension Coordinator {

    func addChildCoordinator(_ coordinator: Coordinator) {
        guard  !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else {
            return
        }

        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                    .filter({ $0 !== coordinator })
                    .forEach({ coordinator.removeChildCoordinator($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
