//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import Foundation

protocol CategoryService {
    func allCategories() -> [String]
}


class MockCategoryService: CategoryService {
    func allCategories() -> [String] {
        let categories = [
            "Магазин",
            "Jusan Invest",
            "Страхование",
            "Jusan Mobile",
            "Jusan Junior",
            "Остальные"
        ]
        return categories
    }
}
