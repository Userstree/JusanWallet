//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

class HomeViewModelImpl: HomeViewModel {
    var catalogCards: [CatalogCard] = []
    var catalogData: [CatalogTableItemDataSource] = []

    private var cardService: CatalogService

    init(categoryService: CatalogService) {
        cardService = categoryService
        catalogCards = categoryService.allCatalogs()
    }
}