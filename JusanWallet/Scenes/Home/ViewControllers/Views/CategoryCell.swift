//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

protocol CategoryCellDataSource {
    var title: String { get set }
}

class CategoryCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 6
        configureViews()
    }

    func configure(with dataSource: CategoryCellDataSource) {
        titleLabel.text = dataSource.title
    }

    private func configureViews() {
        contentView.addSubview(titleLabel)
        makeConstraints()
    }
    private func makeConstraints(){
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
    }
}
