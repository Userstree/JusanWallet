//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class CategoriesCollectionDataSource: NSObject, UICollectionViewDataSource {

    private var viewModel: HomeViewModel!

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.categoryData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CategoryCell.self),
                for: indexPath) as! CategoryCell
        cell.configure(with: viewModel.categoryData[indexPath.section])
        return cell
    }
}
