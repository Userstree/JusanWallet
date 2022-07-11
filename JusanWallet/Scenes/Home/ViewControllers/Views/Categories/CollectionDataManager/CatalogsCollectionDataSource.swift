//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class CatalogsCollectionDataSource: NSObject, UICollectionViewDataSource {

    private var viewModel: HomeViewModel!

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.catalogCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CatalogCell.self),
                for: indexPath) as! CatalogCell
        cell.configure(with: viewModel.catalogCards[indexPath.section])
        return cell
    }
}
