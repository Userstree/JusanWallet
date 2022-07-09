//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
