//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

class HomeViewModelImpl: HomeViewModel {

    var categoryData: [String] = []

    private var cardService: HomeService

    init(service: HomeService) {
        cardService = service
    }
}