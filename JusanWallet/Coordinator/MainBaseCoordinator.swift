//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
    var homeCoordinator: HomeBaseCoordinator { get }
    var deepLinkCoordinator: DeepLinkBaseCoordinator { get }
    func handleDeepLink(text: String)
}

protocol HomeBaseCoordinated {
    var coordinator: HomeBaseCoordinator? { get }
}
