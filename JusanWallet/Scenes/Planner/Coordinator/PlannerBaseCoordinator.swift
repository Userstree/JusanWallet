//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import Foundation

protocol PlannerBaseCoordinator: Coordinator {  }

protocol AccountBaseCoordinated {
    var coordinator: PlannerCoordinator? { get set }
}
