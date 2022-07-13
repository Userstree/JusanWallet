//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import Foundation

class AnalyticsViewModelImpl: AnalyticsViewModel {
    var companyCards: [CatalogCard] = []
    var companyData: [CatalogTableItemDataSource] = []

    private var cardService: CatalogService

    init(catalogService: CatalogService) {
        cardService = catalogService
        companyCards = catalogService.allCatalogs()
    }
}
