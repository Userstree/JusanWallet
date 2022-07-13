//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController, HomeBaseCoordinated, BindableType {
    var viewModel: HomeViewModel!
    var coordinator: HomeBaseCoordinator?
    private lazy var balanceCardView = BalanceCardViewController(frame: .zero, dataSource: viewModel)
    private var selectedCatalog: Int = 0

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var collectionDataSource = CompaniesCollectionDataSource(viewModel: viewModel)

    private lazy var companiesCollection: UICollectionView = {
        let collection = CompaniesCollectionView()
        collection.register(CompaniesCell.self, forCellWithReuseIdentifier: String(describing: CompaniesCell.self))
        collection.dataSource = collectionDataSource
        collection.delegate = self
        return collection
    }()

    private lazy var categoryItemsTableViewController = CatalogItemsTableViewController(dataSource: viewModel.companyData)

    private lazy var companyTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = viewModel.companyCards[0].title
        label.textColor = .onBackground
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

//    private lazy var

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        balanceCardView.view.isUserInteractionEnabled = true
        configureNavBar()
        configureViews()
    }

    private func configureNavBar() {
        let notifications = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationsButtonTapped))
        notifications.tintColor = .onPrimary
        navigationItem.rightBarButtonItem = notifications
        title = "Home"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    @objc private func notificationsButtonTapped() {
        print("Search button tapped")
    }

    func bindViewModel() {

    }

    private func configureViews() {
        [balanceCardView.view,
         companiesCollection,
         companyTitle,
         categoryItemsTableViewController.mainVStack,
        ].forEach(scrollView.addSubview)
        view.addSubview(scrollView)
        makeConstraints()
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            $0.bottom.equalTo(categoryItemsTableViewController.mainVStack.snp.bottom)
        }
        balanceCardView.view.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(8)
            $0.leading.equalTo(scrollView.snp.leading).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.height.equalTo(balanceCardView.mainHStack.snp.height)
//            $0.width.equalTo(view.snp.width).offset(-32)
        }
        companiesCollection.snp.makeConstraints {
            $0.top.equalTo(balanceCardView.view.snp.bottom).offset(20)
            $0.leading.equalTo(scrollView.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(140)
        }
        companyTitle.snp.makeConstraints {
            $0.top.equalTo(companiesCollection.snp.bottom).offset(16)
            $0.leading.equalTo(balanceCardView.view.snp.leading)
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(40)
        }
        categoryItemsTableViewController.mainVStack.snp.makeConstraints {
            $0.top.equalTo(companyTitle.snp.bottom).offset(8)
            $0.width.equalTo(balanceCardView.mainHStack.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(400)
        }
    }

    init(coordinator: HomeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        companyTitle.text = viewModel.companyCards[indexPath.section].title
    }
}