//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

class CategoryCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 118, height: 144)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(CategoryCell.self, forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
