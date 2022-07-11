//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit
import DropDown

class BalanceCardView: UIViewController {
    private lazy var totalBalanceTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Total balance"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private lazy var totalBalanceNumericLabel: UILabel = {
        let label = UILabel()
        label.text = "$12,530"
        label.setContentHuggingPriority(.defaultHigh + 10, for: .horizontal)
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "KZT"
        label.textContainerInset = UIEdgeInsets(top: 4, left: 4, bottom: 2, right: 4)
        label.layer.cornerRadius = 6
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.layer.borderWidth = 0.4
        label.layer.borderColor = UIColor.black.cgColor
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(currencyButtonTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()

    private let currenciesList = ["USD", "KZT", "EU"]

    private lazy var dropDownView: DropDown = {
        let dropDown = DropDown()
        dropDown.dataSource = currenciesList
        dropDown.direction = .bottom
        dropDown.anchorView = currencyLabel
        dropDown.selectionAction = { [unowned self] index, item in
            if index == 0 {
                currencyLabel.text = currenciesList[0]
            } else if index == 1 {
                currencyLabel.text = currenciesList[1]
            } else {
                currencyLabel.text = currenciesList[2]
            }
        }
        return dropDown
    }()

    lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        view.backgroundColor = .white
        return view
    }()

    private let incomeCard: StatisticsView
    private let expensesCard: StatisticsView

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    @objc private func currencyButtonTapped(_ sender: UITapGestureRecognizer) {
        dropDownView.show()
    }

    private lazy var leadingVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceTextLabel, bottomHStack])
        stack.setContentHuggingPriority(.defaultHigh + 20, for: .horizontal)
        stack.axis = .vertical
        return stack
    }()

    private lazy var bottomHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceNumericLabel, currencyLabel])
        stack.setContentHuggingPriority(.defaultHigh + 20, for: .horizontal)
        stack.spacing = 8
        stack.axis = .horizontal
        return stack
    }()

    lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leadingVStack,incomeCard.view, expensesCard.view])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.layer.cornerRadius = 16
        stack.layer.cornerCurve = .continuous
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOffset = CGSize(width: 3, height: 3)
        stack.layer.shadowOpacity = 0.7
        stack.layer.shadowRadius = 4
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.setContentCompressionResistancePriority(.defaultHigh + 50, for: .horizontal)
        stack.spacing = 5
        stack.backgroundColor = .white
        return stack
    }()

    private func configureViews() {
        view.addSubview(mainHStack)
        makeConstraints()
    }

    private func makeConstraints() {
        mainHStack.snp.makeConstraints{
            $0.edges.equalTo(view.snp.edges)
        }
    }

    init(frame: CGRect, dataSource: StatisticsProvidable) {
        incomeCard = StatisticsView(dataSource: dataSource.incomeStatistics)
        expensesCard = StatisticsView(dataSource: dataSource.expensesStatistics)
        super.init(nibName: nil, bundle: nil)
        view.frame = frame
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) ")
    }
}
