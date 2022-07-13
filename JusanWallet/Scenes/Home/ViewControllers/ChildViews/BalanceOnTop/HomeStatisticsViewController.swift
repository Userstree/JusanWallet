//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit


class HomeStatisticsViewController: UIViewController {
    private lazy var chartView = UIImageView()

    private lazy var currentMonthLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var moneyAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private lazy var upperHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [currentMonthLabel, chartView])
        stack.distribution = .equalCentering
        stack.spacing = 4
        return stack
    }()

    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [upperHStack, titleLabel, moneyAmountLabel])
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.makeSmoothCorners(ofRadius: 8)
        stack.elevateView(shadowWidth: 3, shadowHeight: 3, withShadowRadius: 2)
        stack.layer.borderWidth = 0.44
        stack.layer.borderColor = UIColor.onSecondary.withAlphaComponent(0.35).cgColor
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    private func configureViews() {
        [mainVStack].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        mainVStack.snp.makeConstraints {
            $0.edges.equalTo(view.snp.edges)
        }
    }

    init(dataSource: CurrentStatisticsDataSource) {
        super.init(nibName: nil, bundle: nil)
        switch dataSource.moneyMode {
        case .income(let image, let moneyAmount):
            chartView.image = image
            chartView.tintColor = .onSecondaryIncomeVariant
            currentMonthLabel.textColor = .onSecondaryIncomeVariant
            titleLabel.text = dataSource.title
            titleLabel.textColor = .onSecondaryIncomeVariant
            moneyAmountLabel.text = "+$\(moneyAmount)"
            moneyAmountLabel.textColor = .systemGreen.withAlphaComponent(0.88)
            mainVStack.backgroundColor = .secondaryIncomeVariant
        case .expenses(let image, let moneyAmount):
            chartView.image = image
            chartView.tintColor = .onSecondaryIncomeVariant
            currentMonthLabel.textColor = .onSecondaryExpenseVariant
            titleLabel.text = dataSource.title
            titleLabel.textColor = .onSecondaryExpenseVariant
            moneyAmountLabel.text = "-$\(moneyAmount)"
            moneyAmountLabel.textColor = .systemRed.withAlphaComponent(0.88)
            mainVStack.backgroundColor = .secondaryExpensesVariant
        }
        chartView.contentMode = .scaleAspectFit
        currentMonthLabel.text = dataSource.currentMonth
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}