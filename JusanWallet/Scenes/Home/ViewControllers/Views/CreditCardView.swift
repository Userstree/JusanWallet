//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

class CreditCardView: UIViewController {

    private lazy var totalBalanceTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Total balance"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    private lazy var totalBalanceNumericLabel: UILabel = {
        let label = UILabel()
        label.text = "$12,530"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    private lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Income: $8,222"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    private lazy var expensesLabel: UILabel = {
        let label = UILabel()
        label.text = "Expenses: $4,533"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()

    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        view.backgroundColor = .white
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    private func configureViews() {
        [cardView,
         totalBalanceTextLabel,
         totalBalanceNumericLabel,
         incomeLabel,
         expensesLabel,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        totalBalanceTextLabel.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.top).offset(16)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        totalBalanceNumericLabel.snp.makeConstraints {
            $0.top.equalTo(totalBalanceTextLabel.snp.bottom).offset(8)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        incomeLabel.snp.makeConstraints {
            $0.top.equalTo(totalBalanceNumericLabel.snp.bottom).offset(56)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        expensesLabel.snp.makeConstraints {
            $0.top.equalTo(incomeLabel.snp.bottom).offset(5)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        cardView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(48)
            $0.leading.equalTo(view.snp.leading).offset(18)
            $0.trailing.equalTo(view.snp.trailing).offset(-18)
            $0.bottom.equalTo(expensesLabel.snp.bottom).offset(15)
        }
    }
}
