//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

protocol AnalyticsViewModel: TimeCollectionViewModel, DataProvidable{
    var companyCards: [CatalogCard] { get set }
}
