//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit


protocol BalanceStatisticsServiceProvidable {
    var incomeStatistics: CurrentStatisticsDataSource { get }
    var expensesStatistics: CurrentStatisticsDataSource { get }
}

extension BalanceStatisticsServiceProvidable {
    var incomeStatistics: CurrentStatisticsDataSource {
        get {
            let income = CurrentStatistics(
                    currentMonth: "July",
                    title: "Доходы",
                    moneyAmount: 1440,
                    moneyMode: .income(UIImage(systemName: "arrow.up.right")!, 4124)
            )
            return income
        }
    }

    var expensesStatistics: CurrentStatisticsDataSource {
        get {
            let expenses = CurrentStatistics(
                    currentMonth: "July",
                    title: "Расходы",
                    moneyAmount: 1440,
                    moneyMode: .expenses(UIImage(systemName: "arrow.down.right")!, 1423)
            )
            return expenses
        }
    }
}