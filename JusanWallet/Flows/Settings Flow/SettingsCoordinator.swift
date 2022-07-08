//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

final class SettingsCoordinator: BaseCoordinator {

    private let factory: SettingsFactory
    private let router: Router

    init(router: Router, factory: SettingsFactory) {
        self.factory = factory
        self.router = router
    }

    override func start() {
        showSettings()
    }

    private func showSettings() {
        let settingsFlowOutput = factory.makeSettingsOutput()
        router.setRootModule(settingsFlowOutput)
    }
}

