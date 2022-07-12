//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import Foundation

protocol TimeCollectionViewModel {
    var monthsDataSource: TimeCellDataSource { get }
}

extension TimeCollectionViewModel {
    var monthsDataSource: TimeCellDataSource {
        get {
            let months: [String] = ["Январь", "Февраль", "Март", "Апрель",
                                    "Май", "Июнь", "Июль", "Август",
                                    "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"
            ]

            let monthCells = MonthCell(months: months)
            return monthCells
        }
    }
}
