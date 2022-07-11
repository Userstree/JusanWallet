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
        stack.spacing = 8
        stack.axis = .horizontal
        return stack
    }()

    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [upperHStack, titleLabel, moneyAmountLabel])
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.layer.cornerCurve = .continuous
        stack.axis = .vertical
        stack.spacing = 8
        stack.backgroundColor = .black.withAlphaComponent(0.64)
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
            chartView.tintColor = .red
            titleLabel.text = dataSource.title
            moneyAmountLabel.text = "+$\(dataSource.moneyAmount)"
            moneyAmountLabel.textColor = .systemGreen.withAlphaComponent(0.78)
        case .expenses(let image):
            chartView.image = image
            titleLabel.text = dataSource.title
            moneyAmountLabel.text = "-$\(dataSource.moneyAmount)"
            moneyAmountLabel.textColor = .systemRed
        }
//        mainVStack.backgroundColor = .systemGreen
        currentMonthLabel.text = dataSource.currentMonth
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}