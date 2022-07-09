//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

protocol PaymentsBaseCoordinator: Coordinator {  }

protocol PaymentsBaseCoordinated {
    var coordinator: PaymentsCoordinator? { get }
}