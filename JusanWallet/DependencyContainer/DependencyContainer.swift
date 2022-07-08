//
//  DependencyContainer.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
typealias ViewControllerFactory = AuthViewControllerFactory //& SideMenuViewControllerFactory & WalktroughViewControllerFactory & SettingsViewControllerFactory & ProfileViewControllerFactory & PaymentViewControllerFactory & EventsViewControllerFactory

class DependencyContainer {
    
    // MARK: - Vars & Lets
    
    private var rootController: UINavigationController
    
    // MARK: App Coordinator
    
    internal lazy var aplicationCoordinator = self.instantiateApplicationCoordinator()
    
    // MARK: - Public func
    
    func start() {
        self.aplicationCoordinator.start()
    }
    
    // MARK: - Initialization
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
}

// MARK: - Extensions
// MARK: - CoordinatorFactoryProtocol

extension DependencyContainer: CoordinatorFactoryProtocol {
    
    func instantiateApplicationCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(router: Router(rootController: rootController), factory: self as Factory, launchInstructor: LaunchInstructor.configure())
    }
    
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator {
        return AuthCoordinator(router: router, factory: self)
    }

}
