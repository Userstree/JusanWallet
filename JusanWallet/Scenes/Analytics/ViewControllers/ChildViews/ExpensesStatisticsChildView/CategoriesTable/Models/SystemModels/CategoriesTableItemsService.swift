//
// Created by Dossymkhan Zhulamanov on 14.07.2022.
//

import UIKit

protocol CategoriesTableItemsService {
    var categoryItems: [CategoryItemTableCellData] { get }
}

extension CategoriesTableItemsService {
    var categoryItems: [CategoryItemTableCellData] {
        let entertainment = CategoryItemTableCellData(logoImage: UIImage(named: "entertainmentIcon")!, title: "Развлечения", subTitle: "PS5 Club", amount: 700)
        let food = CategoryItemTableCellData(logoImage: UIImage(named: "foodAndDrinkIcon")!, title: "Еда и Напитки", subTitle: "Магнум", amount: 2310)
        let transport = CategoryItemTableCellData(logoImage: UIImage(named: "transportIcon")!, title: "Поездки", subTitle: "st. Peterburg Metro", amount: 90)
        let shopping = CategoryItemTableCellData(logoImage: UIImage(named: "shoppingIcon")!, title: "Shopping", subTitle: "Marvin", amount: 1320)
        let education = CategoryItemTableCellData(logoImage: UIImage(named: "educationIcon")!, title: "Обучение", subTitle: "Курсы немецкого", amount: 9000)
        return [entertainment, food, transport, shopping, education]
    }
}
