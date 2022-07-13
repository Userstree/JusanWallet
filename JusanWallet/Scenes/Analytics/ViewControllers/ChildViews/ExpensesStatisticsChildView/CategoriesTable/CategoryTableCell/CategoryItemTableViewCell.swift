//
// Created by Dossymkhan Zhulamanov on 13.07.2022.
//

import UIKit

struct CategoryItemTableCellData {
    let logoImage: UIImage
    let title: String
    let subTitle: String
    let amount: Int
}

class CategoryItemTableViewCell: UITableViewCell {
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh + 15, for: .horizontal)
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
        label.textColor = .onSecondary
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var rightVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel])
        stack.axis = .vertical
        return stack
    }()

    private lazy var centerVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.alignment = .leading
        stack.axis = .vertical
        return stack
    }()

    private lazy var leadingHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImage, centerVStack])
        stack.setContentCompressionResistancePriority(.defaultHigh + 50, for: .horizontal)
        stack.spacing = 16
        return stack
    }()

    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leadingHStack, rightVStack])
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
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

    func configure(with data: CategoryItemTableCellData) {
        logoImage.image = data.logoImage
        amountLabel.text = "\(data.amount)"
        subTitleLabel.text = data.subTitle
        titleLabel.text = data.title
    }

    private func configureViews() {
        contentView.addSubview(mainHStack)
        makeConstraints()
    }
    private func makeConstraints(){
        logoImage.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 60, height: 60))
        }
        mainHStack.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
//            $0.leading.trailing.equalTo(contentView)
        }
    }
}