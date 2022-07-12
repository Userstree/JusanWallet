//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

final class ExpensesParentViewController: UIViewController, ExpensesBaseCoordinated, BindableType {
    var coordinator: ExpensesCoordinator?
    var viewModel: ExpensesViewModel!
    private var isStatisticsActive: Bool = true {
        didSet {
            if isStatisticsActive {
                switchChildViewControllers(isFirst: isStatisticsActive)
                historyChildViewController.remove()
            } else {
                expensesChildViewController.remove()
                switchChildViewControllers(isFirst: isStatisticsActive)
            }
        }
    }

    private lazy var statisticsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Statistics", for: .normal)
        button.backgroundColor = .systemGray5
        button.makeSmoothCorners(ofRadius: 8)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(statisticsButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("History", for: .normal)
        button.backgroundColor = .systemGray5
        button.makeSmoothCorners(ofRadius: 8)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()

    private var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 12
        return stack
    }()

    private lazy var expensesChildViewController = ExpensesStatisticsChildViewController(viewModel: viewModel)
    private lazy var historyChildViewController = HistoryChildViewController(viewModel: viewModel)

    @objc private func historyButtonTapped() {
        isStatisticsActive = false
    }

    @objc private func statisticsButtonTapped() {
        isStatisticsActive = true
    }

    func bindViewModel() {

    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primaryColor
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    override func loadView() {
        super.loadView()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        configureNavTitle()
        configureViews()
        switchChildViewControllers(isFirst: true)
    }

    private func switchChildViewControllers(isFirst: Bool) {
        if isFirst {
            addRelativeTo(someView: mainHStack, offsetTop: 4, offsetBottom: 88, expensesChildViewController)
        } else {
            addRelativeTo(someView: mainHStack, offsetTop: 4, offsetBottom: 88, historyChildViewController)
        }
    }

    private func configureViews() {
        [statisticsButton, historyButton].forEach(mainHStack.addArrangedSubview)
        view.addSubview(mainHStack)
        makeConstraints()
    }

    private func makeConstraints() {
        mainHStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.height.equalTo(40)
        }
    }

    init(coordinator: ExpensesCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Expenses"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
