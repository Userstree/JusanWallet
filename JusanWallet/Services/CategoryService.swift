//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

protocol CategoryService {
    func allCategories() -> [EcosystemCategory]
}

class MockCategoryService: CategoryService {

    func allCategories() -> [EcosystemCategory] {
        categoryTitlesList.enumerated().map { index, title -> EcosystemCategory in
            EcosystemCategory(
                    title: title,
                    amount: Int.random(in: 0..<5000),
                    cardColor: cardColors[index],
                    icon: iconsList[index]!
            )
        }
    }

    let cardColors: [UIColor] = [
        .orange,
        .blue,
        .orange,
        .systemCyan,
        .blue,
        .orange
    ]

    let iconsList = [
        UIImage(systemName: "bag"),
        UIImage(systemName: "chart.line.uptrend.xyaxis"),
        UIImage(systemName: "bolt.shield"),
        UIImage(systemName: "phone.connection"),
        UIImage(systemName: "hare"),
        UIImage(systemName: "dots.and.line.vertical.and.cursorarrow.rectangle"),
    ]

    let categoryTitlesList = [
        "Магазин",
        "Jusan Invest",
        "Страхование",
        "Jusan Mobile",
        "Jusan Junior",
        "Остальные"
    ]
}
