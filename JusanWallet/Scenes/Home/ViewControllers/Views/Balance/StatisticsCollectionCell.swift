//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

class StatisticsCollectionCell: UICollectionViewCell {
    private lazy var iconView = UIButton()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 24
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 5, height: 3)
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 3
        contentView.backgroundColor = .systemGray5
//        iconView.tintColor = .orange
        configureViews()
    }

    func configure(with dataSource: CategoryCellDataSource) {
        titleLabel.text = dataSource.title
        iconView.setImage(dataSource.icon, for: .normal)
        amountLabel.text = "$\(dataSource.amount)"
        self.iconView.tintColor = dataSource.cardColor
    }

    private func configureViews() {
        [titleLabel, iconView, amountLabel].forEach(contentView.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        iconView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(28)
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.size.equalTo(CGSize(width: 24, height: 24))
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconView.snp.bottom).offset(5)
            $0.centerX.equalTo(contentView.snp.centerX)
        }
        amountLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
            $0.centerX.equalTo(contentView.snp.centerX)
        }
    }
}