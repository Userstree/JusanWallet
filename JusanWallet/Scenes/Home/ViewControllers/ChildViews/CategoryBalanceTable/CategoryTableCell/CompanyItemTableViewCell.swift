//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit
import SnapKit

class CompanyItemTableViewCell: UITableViewCell {
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh + 5, for: .horizontal)
        imageView.layer.cornerRadius = 20
        return imageView
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    lazy var rightVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel])
        stack.axis = .vertical
        return stack
    }()

    lazy var centerVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        return stack
    }()

    lazy var leadingHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImage, centerVStack])
        stack.setContentCompressionResistancePriority(.defaultHigh + 50, for: .horizontal)
        stack.spacing = 16
        return stack
    }()

    lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leadingHStack, rightVStack])
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.setContentCompressionResistancePriority(.defaultHigh + 50, for: .horizontal)
        stack.spacing = 5
        return stack
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        configureViews()
        contentView.layer.cornerRadius = 12
        contentView.layer.cornerCurve = .continuous
        contentView.backgroundColor = .surface
    }

    func configure(with dataSource: CatalogTableItemDataSource) {
        logoImage.image = dataSource.logoImage
        amountLabel.text = "\(dataSource.amount)"
        titleLabel.text = dataSource.title
        subTitleLabel.text = dataSource.subTitle
    }

    private func configureViews() {
        contentView.addSubview(mainHStack)
        makeConstraints()
    }
    private func makeConstraints(){
        mainHStack.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
        }
    }
}
