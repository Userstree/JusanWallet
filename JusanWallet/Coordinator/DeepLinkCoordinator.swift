//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

class DeepLinkCoordinator: DeepLinkBaseCoordinator {
    
    func handleDeeplink(deepLink: String) {
        print("")
    }
    
    var parentCoordinator: MainBaseCoordinator?
    
    init(mainBaseCoordinator: MainBaseCoordinator) {
        self.parentCoordinator = mainBaseCoordinator
    }
}
