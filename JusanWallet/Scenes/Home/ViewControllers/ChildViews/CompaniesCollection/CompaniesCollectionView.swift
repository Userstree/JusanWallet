//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

class CompaniesCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 108, height: 138)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(CompaniesCell.self, forCellWithReuseIdentifier: String(describing: CompaniesCell.self))
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        decelerationRate = .normal
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
