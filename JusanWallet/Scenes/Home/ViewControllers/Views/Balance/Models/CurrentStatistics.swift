//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit


protocol CurrentStatisticsDataSource {
    var currentMonth: String { get set }
    var title: String { get set }
    var moneyAmount: Int { get set }
    var moneyMode: MoneyMode { get set }
}

enum MoneyMode {
    case income(UIImage)
    case expenses(UIImage)
}

struct CurrentStatistics: CurrentStatisticsDataSource {
    var currentMonth: String
    var title: String
    var moneyAmount: Int
    var moneyMode: MoneyMode
}
