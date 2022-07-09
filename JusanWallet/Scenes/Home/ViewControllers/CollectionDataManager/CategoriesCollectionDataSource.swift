//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class CategoriesCollectionDataSource: NSObject, UICollectionViewDataSource {
    
//    init(viewModel: ) {
//
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CategoryCell.self),
                for: indexPath) as! CategoryCell
//        cell.configure(with: <#T##CategoryCellDataSource##JusanWallet.CategoryCellDataSource#>)
        return cell
    }
}
