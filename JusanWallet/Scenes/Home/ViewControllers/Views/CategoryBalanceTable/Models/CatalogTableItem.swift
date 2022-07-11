//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

typealias CatalogItemsDataList = [CatalogTableItemDataSource]

protocol CatalogTableItemDataSource {
    var logoImage: UIImage { get set }
    var title: String { get set }
    var subTitle: String { get set }
    var amount: Int { get set }
}

struct CatalogTableItem: CatalogTableItemDataSource {
    var title: String = ""
    var subTitle: String = ""
    var amount: Int = 0
    var logoImage: UIImage
}
