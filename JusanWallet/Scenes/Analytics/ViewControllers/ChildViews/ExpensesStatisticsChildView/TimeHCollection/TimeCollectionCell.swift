//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit
import SnapKit


protocol TimeCellDataSource {
    var months: [String] { get set }
}

struct MonthCell: TimeCellDataSource {
    var months: [String] = []
}

class TimeCollectionCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        configureViews()
    }

    func configure(with month: String) {
        titleLabel.text = month
    }

    private func configureViews(){
        contentView.layer.cornerRadius = 8
        contentView.addSubview(titleLabel)
        makeConstraints()
    }
    private func makeConstraints(){
        titleLabel.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
        }
    }
}
