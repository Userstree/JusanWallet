//
// Created by Dossymkhan Zhulamanov on 14.07.2022.
//

import UIKit

protocol IncomesTableItemsService {
    var incomeItems: [CategoryItemTableCellData] { get }
}

extension IncomesTableItemsService {
    var incomeItems: [CategoryItemTableCellData] {
        let taxiDriver = CategoryItemTableCellData(logoImage: UIImage(named: "yandexTaxiIcon")!, title: "Такси подработки", subTitle: "за 10 маршрутов", amount: 150000)
        let mainJob = CategoryItemTableCellData(logoImage: UIImage(named: "teslaIcon")!, title: "Основная место работы", subTitle: "зарплата", amount: 5000000)
        let freelancing = CategoryItemTableCellData(logoImage: UIImage(named: "fiverrIcon")!, title: "Фрилансинг", subTitle: "IOS проект", amount: 90)
        return [taxiDriver, mainJob, freelancing]
    }
}
