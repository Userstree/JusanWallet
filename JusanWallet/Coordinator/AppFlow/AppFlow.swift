//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

enum AppFlow {
    case home(HomeScreen)
    case expenses(ExpensesScreen)
}

enum HomeScreen {
    case initialScreen
}

enum ExpensesScreen {
    case initialScreen
}
