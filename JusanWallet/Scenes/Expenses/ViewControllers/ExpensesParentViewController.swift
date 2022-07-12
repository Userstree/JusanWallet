//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit
import EasySocialButton
import Parchment

final class ExpensesParentViewController: UIViewController, ExpensesBaseCoordinated, BindableType {
    var coordinator: ExpensesCoordinator?
    var viewModel: ExpensesViewModel!
    private var controllerTitles = ["Expenses", "Income", ]

    private lazy var expensesChildViewController = ExpensesStatisticsChildViewController(viewModel: viewModel)
    private lazy var historyChildViewController = HistoryChildViewController(viewModel: viewModel)

//    private lazy var pagingViewController: PagingViewController = {
//        let pagingVC = PagingViewController(viewControllers: <#T##[UIViewController]##[UIKit.UIViewController]#>)
//    }()

    func bindViewModel() {

    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primary
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    override func loadView() {
        super.loadView()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavTitle()
        configureViews()
    }


    private func configureViews() {
//        [statisticsButton, historyButton].forEach(mainHStack.addArrangedSubview)
//        view.addSubview(mainHStack)
        makeConstraints()
    }

    private func makeConstraints() {
//        mainHStack.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
//            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
//            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
//            $0.height.equalTo(40)
//        }
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
