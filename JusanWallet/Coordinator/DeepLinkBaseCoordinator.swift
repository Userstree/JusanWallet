//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

protocol DeepLinkBaseCoordinator: FlowCoordinator {
    func handleDeeplink(deepLink: String)
}
