//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

class HomeViewModelImpl: HomeViewModel {
    var companyCards: [CatalogCard] = []
    var companyData: [CatalogTableItemDataSource] = []

    private var cardService: CatalogService

    init(categoryService: CatalogService) {
        cardService = categoryService
        companyCards = categoryService.allCatalogs()
    }
}