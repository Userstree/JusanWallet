//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class CompaniesCollectionDataSource: NSObject, UICollectionViewDataSource {

    private var viewModel: HomeViewModel!

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.companyCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CompaniesCell.self),
                for: indexPath) as! CompaniesCell
        cell.configure(with: viewModel.companyCards[indexPath.section])
        return cell
    }
}
