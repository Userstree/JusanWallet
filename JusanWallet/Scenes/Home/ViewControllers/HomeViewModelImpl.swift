//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

class HomeViewModelImpl: HomeViewModel {

    var categoryData: [EcosystemCategory] = []

    private var cardService: CategoryService

    init(service: CategoryService) {
        cardService = service
        categoryData = service.allCategories()
    }
}