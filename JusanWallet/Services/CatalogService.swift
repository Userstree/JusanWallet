//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

protocol CatalogService {
    func allCatalogs() -> [CatalogCard]
}

class MockCatalogService: CatalogService {

    func allCatalogs() -> [CatalogCard] {
        companyTitlesList.enumerated().map { index, title -> CatalogCard in
            CatalogCard(
                    title: title,
                    amount: Int.random(in: 0..<5000),
                    cardColor: cardColor,
                    icon: iconsList[index]!
            )
        }
    }

    let cardColor: UIColor = .orange

    let iconsList = [
        UIImage(systemName: "bag"),
        UIImage(systemName: "chart.line.uptrend.xyaxis"),
        UIImage(systemName: "bolt.shield"),
        UIImage(systemName: "phone.connection"),
        UIImage(systemName: "hare"),
        UIImage(systemName: "dots.and.line.vertical.and.cursorarrow.rectangle"),
    ]

    let companyTitlesList = [
        "Магазин",
        "Jusan Invest",
        "Страхование",
        "Jusan Mobile",
        "Jusan Junior",
        "Остальные"
    ]
}
