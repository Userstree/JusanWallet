//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

typealias CatalogItemsDataList = [CatalogTableItemDataSource]

extension CatalogItemsDataList {
    var companyData: [CatalogTableItemDataSource] {
        get {
            let companyTableItems: [CatalogTableItemDataSource] = [
                CatalogTableItem(title: "IPhone 13 mini", subTitle: "IPoint", amount: 799, logoImage: UIImage(systemName: "iphone")!),
                CatalogTableItem(title: "Sony Headphones", subTitle: "Sony Store", amount: 499, logoImage: UIImage(systemName: "headphones")!),
                CatalogTableItem(title: "Magic Mouse", subTitle: "IPoint", amount: 249, logoImage: UIImage(systemName: "magicmouse")!),
                CatalogTableItem(title: "Macbook Pro 14'", subTitle: "Apple", amount: 1799, logoImage: UIImage(systemName: "laptopcomputer")!),
            ]
            return companyTableItems
        }
    }
}

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
