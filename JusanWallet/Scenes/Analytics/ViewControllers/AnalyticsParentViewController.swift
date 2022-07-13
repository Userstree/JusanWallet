//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit
import EasySocialButton
import Parchment

final class AnalyticsParentViewController: UIViewController, AnalyticsBaseCoordinated, BindableType {
    var coordinator: AnalyticsCoordinator?
    var viewModel: AnalyticsViewModel!

    private var controllerTitles = ["Expenses",
                                    "Income",
                                    "Investments",
                                    "Transfer",
                                    "History"
    ]

    private lazy var viewControllers: [UIViewController] = [expensesStatChildViewController,
                                                            incomeStatChildViewController,
                                                            investmentStatChildViewController,
                                                            transferStatChildViewController,
                                                            historyChildViewController,
    ]

    private lazy var expensesStatChildViewController = ExpensesStatisticsChildViewController(viewModel: viewModel)
    private lazy var historyChildViewController = HistoryChildViewController(viewModel: viewModel)
    private lazy var incomeStatChildViewController = IncomeStatisticsChildViewController(viewModel: viewModel)
    private lazy var investmentStatChildViewController = InvestmentStatisticsChildViewController(viewModel: viewModel)
    private lazy var transferStatChildViewController = TransferStatisticsChildViewController(viewModel: viewModel)

    private lazy var pagingViewController: PagingViewController = {
        let pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.dataSource = self
        pagingViewController.sizeDelegate = self

        pagingViewController.selectedBackgroundColor = .surface.withAlphaComponent(0.85)
        pagingViewController.selectedTextColor = .white
        pagingViewController.indicatorColor = .white
        pagingViewController.textColor = .onPrimary
        pagingViewController.backgroundColor = .surface
        pagingViewController.menuBackgroundColor = .background

        return pagingViewController
    }()

    func bindViewModel() {

    }

    private func configureNavBar() {
        title = "Analytics"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavBar()
        configureViews()
    }

    private func configureViews() {
        add(pagingViewController)
        view.addSubview(pagingViewController.view)
        makeConstraints()
    }

    private func makeConstraints() {
        pagingViewController.view.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

    init(coordinator: AnalyticsCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnalyticsParentViewController: PagingViewControllerDataSource {
    public func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        viewControllers.count
    }

    public func pagingViewController(_ controller: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let viewController = viewControllers[index]
        return viewController
    }

    public func pagingViewController(_ controller: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        PagingIndexItem(index: index, title: controllerTitles[index])
    }
}

extension AnalyticsParentViewController: PagingViewControllerSizeDelegate {
    func pagingViewController(_ pagingViewController: PagingViewController, widthForPagingItem pagingItem: PagingItem, isSelected: Bool) -> CGFloat {
        guard let item = pagingItem as? PagingIndexItem else {
            return 0
        }

        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: pagingViewController.options.menuItemSize.height)
        let attributes = [NSAttributedString.Key.font: pagingViewController.options.font]

        let rect = item.title.boundingRect(with: size,
                options: .usesLineFragmentOrigin,
                attributes: attributes,
                context: nil)

        let width = ceil(rect.width) + insets.left + insets.right

        if isSelected {
            return width * 1.5
        } else {
            return width
        }
    }
}
