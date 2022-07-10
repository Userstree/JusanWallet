//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit


class StatisticsView: UIViewController {
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
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        return stack
    }()

    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [upperHStack, titleLabel, moneyAmountLabel])
        stack.axis = .vertical
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
        case .income(let image):
            chartView.image = image
            titleLabel.text = "Income"
            moneyAmountLabel.text = "+$\(dataSource.moneyAmount)"
        case .expenses(let image):
            chartView.image = image
            titleLabel.text = "Expenses"
            moneyAmountLabel.text = "-$\(dataSource.moneyAmount)"
        }
        currentMonthLabel.text = dataSource.currentMonth
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}