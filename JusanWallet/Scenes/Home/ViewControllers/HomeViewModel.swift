//
//  HomeViewModel.swift
//  JusanWallet
//
//  Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

protocol HomeViewModel: StatisticsProvidable {
    var categoryData: [EcosystemCategory] { get set }
}

protocol StatisticsProvidable {
    var incomeStatistics: CurrentStatisticsDataSource { get }
    var expensesStatistics: CurrentStatisticsDataSource { get }
}

extension StatisticsProvidable {
    var incomeStatistics: CurrentStatisticsDataSource {
        get {
            let income = CurrentStatistics(
                    currentMonth: "July",
                    title: "Income",
                    moneyAmount: 1440,
                    moneyMode: .income(UIImage(named: "uptrendChart")!)
            )
            return income
        }
    }

    var expensesStatistics: CurrentStatisticsDataSource {
        get {
            let expenses = CurrentStatistics(
                    currentMonth: "July",
                    title: "Expenses",
                    moneyAmount: 1440,
                    moneyMode: .expenses(UIImage(named: "declineChart")!)
            )
            return expenses
        }
    }
}