//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

protocol ExpensesBaseCoordinator: Coordinator {  }

protocol ExpensesBaseCoordinated {
    var coordinator: ExpensesCoordinator? { get }
}