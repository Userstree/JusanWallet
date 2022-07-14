//
// Created by Dossymkhan Zhulamanov on 14.07.2022.
//

import UIKit

protocol GoalsTableItemsService {
    var goalsItems: [CategoryItemTableCellData] { get }
}

extension GoalsTableItemsService {
    var goalsItems: [CategoryItemTableCellData] {
        let laptop = CategoryItemTableCellData(logoImage: UIImage(systemName: "laptopcomputer")!, title: "Ноутбук", subTitle: "Последней модели", amount: 550000)
        let phone = CategoryItemTableCellData(logoImage: UIImage(systemName: "iphone")!, title: "Iphone 14", subTitle: "смартфон с хорошей камерой", amount: 460000)
        let car = CategoryItemTableCellData(logoImage: UIImage(systemName: "car")!, title: "Автомобиль", subTitle: "Ездить по городу", amount: 4130000)
        return [laptop, phone, car]
    }
}
