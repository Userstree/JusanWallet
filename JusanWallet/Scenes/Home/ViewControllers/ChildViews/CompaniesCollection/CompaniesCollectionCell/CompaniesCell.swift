//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

protocol CompaniesCardDataSource {
    var title: String { get set }
    var icon: UIImage { get set }
    var amount: Int { get set }
    var cardColor: UIColor { get set }
}

class CompaniesCell: UICollectionViewCell {
//    private var viewModel: CompaniesCardDataSource!
    private lazy var iconImage = UIImageView()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .onSurface
        label.lineBreakMode = .byClipping
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.lineBreakMode = .byClipping
        return label
    }()

    private lazy var bonustLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.lineBreakMode = .byClipping
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 16
        contentView.layer.cornerCurve = .continuous
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 5, height: 3)
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 3
        contentView.backgroundColor = .surface
        configureViews()
    }

    func configure(with dataSource: CompaniesCardDataSource) {
        titleLabel.text = dataSource.title
        iconImage.image = dataSource.icon
        amountLabel.text = "\(dataSource.amount)"
        bonustLabel.text = " + \(Int(dataSource.amount / 95))"
        iconImage.tintColor = dataSource.cardColor
    }

    private func configureViews() {
        [titleLabel,
         iconImage,
         amountLabel,
         bonustLabel
        ].forEach(contentView.addSubview)
        makeConstraints()
    }
    private func makeConstraints() {
        iconImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(28)
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.size.equalTo(CGSize(width: 24, height: 24))
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImage.snp.bottom).offset(5)
            $0.centerX.equalTo(contentView.snp.centerX)
        }
        amountLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
            $0.centerX.equalTo(contentView.snp.centerX).offset(-18)
        }
        bonustLabel.snp.makeConstraints {
            $0.bottom.equalTo(amountLabel.snp.bottom)
            $0.leading.equalTo(amountLabel.snp.trailing)
        }
    }
}
