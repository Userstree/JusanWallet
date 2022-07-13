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
        label.textColor = .onSurface
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private lazy var totalBalanceNumericLabel: UILabel = {
        let label = UILabel()
        label.textColor = .onSurface
        label.text = "\(Int.random(in: 1000..<9999))"
        label.setContentHuggingPriority(.defaultHigh + 10, for: .horizontal)
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    private let currenciesList = ["USD", "KZT", "EU"]

    private lazy var dropDownView: DropDown = {
        let dropDown = DropDown()
        dropDown.dataSource = currenciesList
        dropDown.backgroundColor = .secondary
        dropDown.direction = .bottom
        dropDown.textColor = .onSecondary
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

    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "KZT"
        label.textContainerInset = UIEdgeInsets(top: 4, left: 4, bottom: 2, right: 4)
        label.layer.cornerRadius = 6
        label.textColor = .onSecondary
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.layer.borderWidth = 0.7
        label.layer.borderColor = UIColor.primaryVariant.cgColor
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(currencyButtonTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()
    private let incomeCard: HomeStatisticsView
    private let expensesCard: HomeStatisticsView

    lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leadingVStack, incomeCard.view, expensesCard.view])
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.makeSmoothCorners(ofRadius: 16)
        stack.elevateView()
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 8
        stack.backgroundColor = .surface
        return stack
    }()
    private lazy var bottomHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceNumericLabel, currencyLabel])
//        stack.setContentHuggingPriority(.defaultHigh + 20, for: .horizontal)
        stack.distribution = .fillProportionally
        stack.spacing = 4
        return stack
    }()
    private lazy var leadingVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceTextLabel, bottomHStack])
//        stack.setContentHuggingPriority(.defaultHigh + 10, for: .horizontal)
        stack.setContentCompressionResistancePriority(.defaultHigh + 10, for: .horizontal)
        stack.distribution = .equalCentering
        stack.spacing = 6
        stack.axis = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        settingColors()
    }

    @objc private func currencyButtonTapped(_ sender: UITapGestureRecognizer) {
        dropDownView.show()
    }

    private func settingColors() {
        incomeCard.view.backgroundColor = .secondaryIncomeVariant

        expensesCard.view.backgroundColor = .secondaryExpensesVariant
    }

    private func configureViews() {
        incomeCard.view.setContentCompressionResistancePriority(.defaultHigh+10, for: .horizontal)
        incomeCard.view.setContentHuggingPriority(.defaultLow - 10, for: .horizontal)
        view.addSubview(mainHStack)
        makeConstraints()
    }

    private func makeConstraints() {
        mainHStack.snp.makeConstraints{
            $0.edges.equalTo(view.snp.edges)
        }
    }

    init(frame: CGRect, dataSource: BalanceStatisticsServiceProvidable) {
        incomeCard = HomeStatisticsView(dataSource: dataSource.incomeStatistics)
        expensesCard = HomeStatisticsView(dataSource: dataSource.expensesStatistics)
        super.init(nibName: nil, bundle: nil)
        view.frame = frame
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) ")
    }
}
