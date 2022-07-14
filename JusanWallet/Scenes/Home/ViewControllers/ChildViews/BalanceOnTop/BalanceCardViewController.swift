//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit
import DropDown

class BalanceCardViewController: UIViewController {
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
        label.text = "\(3244)"
        label.allowsDefaultTighteningForTruncation = true
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.layer.borderWidth = 0.7
        label.layer.borderColor = UIColor.primaryVariant.cgColor
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(currencyButtonTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()
    private let incomeCard: HomeStatisticsViewController
    private let expensesCard: HomeStatisticsViewController

    lazy var mainHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leadingVStack, incomeCard.view, expensesCard.view])
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.makeSmoothCorners(ofRadius: 16)
        stack.elevateView()
        stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 8
        stack.backgroundColor = .surface
        return stack
    }()
    private lazy var bottomHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceNumericLabel, currencyLabel])
        stack.distribution = .fillProportionally
        stack.spacing = 2
        return stack
    }()
    private lazy var leadingVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalBalanceTextLabel, bottomHStack])
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
        currencyLabel.snp.makeConstraints {
            $0.width.equalTo(40)
        }
        totalBalanceNumericLabel.snp.makeConstraints {
            $0.width.equalTo(55)
        }
    }

    init(frame: CGRect, dataSource: BalanceStatisticsServiceProvidable) {
        incomeCard = HomeStatisticsViewController(dataSource: dataSource.incomeStatistics)
        expensesCard = HomeStatisticsViewController(dataSource: dataSource.expensesStatistics)
        super.init(nibName: nil, bundle: nil)
        view.frame = frame
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) ")
    }
}
