//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit


class MonthsCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var viewModel: TimeCellDataSource!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.months.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MonthCollectionCell.self), for: indexPath) as! MonthCollectionCell
        cell.configure(with: viewModel.months[indexPath.item])
        cell.backgroundColor = .surface
        cell.contentView.makeSmoothCorners(ofRadius: 6)
        cell.clipsToBounds = true
        return cell
    }

    init(viewModel: TimeCollectionViewModel) {
        super.init()
        self.viewModel = viewModel.monthsDataSource
    }
}
