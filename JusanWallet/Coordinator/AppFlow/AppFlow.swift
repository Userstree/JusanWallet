//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

enum AppFlow {
    case home(HomeScreen)
    case expenses(ExpensesScreen)
    case automaticPayments(AutomaticPaymentsScreen)
    case planner(PlannerScreen)
}

enum HomeScreen {
    case initialScreen
}

enum ExpensesScreen {
    case initialScreen
}

enum AutomaticPaymentsScreen {
    case initialScreen
}

enum PlannerScreen {
    case initialScreen
}
