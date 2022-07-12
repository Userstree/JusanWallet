//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit


class TimeCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var viewModel: TimeCellDataSource!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.months.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TimeCollectionCell.self), for: indexPath) as! TimeCollectionCell
        cell.configure(with: viewModel.months[indexPath.row])
        return cell
    }

    
    init(viewModel: TimeCollectionViewModel) {
        super.init()
        self.viewModel = viewModel.monthsDataSource
    }
}

extension TimeCollectionDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = viewModel.months[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 30)
    }
}
