//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import Foundation

protocol AccountBaseCoordinator: Coordinator {  }

protocol AccountBaseCoordinated {
    var coordinator: AccountCoordinator? { get set }
}
