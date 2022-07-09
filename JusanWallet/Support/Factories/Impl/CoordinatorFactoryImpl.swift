//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

final class CoordinatorFactoryImpl: CoordinatorFactory {
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }

    func makeAuthCoordinatorBox(router: Router) -> AuthCoordinatorOutput & Coordinator {
        <#code#>
    }

    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator {
        <#code#>
    }

    func makeItemCoordinator() -> Coordinator {
        <#code#>
    }

    func makeSettingsCoordinator() -> Coordinator {
        <#code#>
    }

    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator {
        <#code#>
    }
}
