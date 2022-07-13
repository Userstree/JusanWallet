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
            CurrentStatistics(
                    currentMonth: "July",
                    title: "Доходы",
                    moneyAmount: 1440,
                    moneyMode: .income(UIImage(systemName: "arrow.up")!, 7534)
            )
    }

    var expensesStatistics: CurrentStatisticsDataSource {
            CurrentStatistics(
                    currentMonth: "July",
                    title: "Расходы",
                    moneyAmount: 1440,
                    moneyMode: .expenses(UIImage(systemName: "arrow.down")!, 5234)
            )
    }
}