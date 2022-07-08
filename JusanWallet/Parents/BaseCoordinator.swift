//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

class BaseCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController

    var childCoordinators: [Coordinator] = []

    var type: CoordinatorType

    func start(with option: DeepLinkOption) {  }

    func start() {
        start(with: nil)
    }

    func start(with option: DeepLinkOption?) {  }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}
