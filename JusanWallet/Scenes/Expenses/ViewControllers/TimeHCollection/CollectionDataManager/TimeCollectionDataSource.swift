//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

protocol TimeCollectionViewModel{

}

class TimeCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var viewModel: TimeCollectionViewModel!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TimeCollectionCell.self), for: indexPath) as! TimeCollectionCell
        return cell
    }

    override init(viewModel: TimeCollectionViewModel) {
        super.init()
        self.viewModel = viewModel
    }
}

extension TimeCollectionDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 30)
    }
}