//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

protocol HomeBaseCoordinator: Coordinator {  }

protocol HomeBaseCoordinated {
    var coordinator: HomeBaseCoordinator? { get }
}