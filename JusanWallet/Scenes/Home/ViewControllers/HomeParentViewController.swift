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
    
    private lazy var colletionTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Экосистема Jusan"
        label.textColor = .onBackground
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

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

    private lazy var addGoalButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.tintColor = .primaryVariant
        return button
    }()

    lazy var goalsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CategoryItemTableViewCell.self, forCellReuseIdentifier: String(describing: CategoryItemTableViewCell.self))
        table.dataSource = self
        table.delegate = self
        table.showsVerticalScrollIndicator = false
        table.layer.cornerRadius = 16
        table.layer.cornerCurve = .continuous
        table.layer.shadowColor = UIColor.black.cgColor
        table.layer.shadowOffset = CGSize(width: 3, height: 3)
        table.layer.shadowOpacity = 0.7
        table.layer.shadowRadius = 4
        table.backgroundColor = .clear
        return table
    }()

    private lazy var goalsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Цели"
        label.textColor = .onBackground
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

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
         colletionTitle,
         companiesCollection,
         companyTitle,
         categoryItemsTableViewController.mainVStack,
         goalsTitle,
         addGoalButton,
         goalsTable,
        ].forEach(scrollView.addSubview)
        view.addSubview(scrollView)
        makeConstraints()
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            $0.bottom.equalTo(goalsTable.snp.bottom).offset(100)
        }
        balanceCardView.view.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(8)
            $0.leading.equalTo(scrollView.snp.leading).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.height.equalTo(balanceCardView.mainHStack.snp.height)
//            $0.width.equalTo(view.snp.width).offset(-32)
        }
        colletionTitle.snp.makeConstraints {
            $0.top.equalTo(balanceCardView.mainHStack.snp.bottom).offset(16)
            $0.leading.equalTo(balanceCardView.view.snp.leading)
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(40)
        }
        companiesCollection.snp.makeConstraints {
            $0.top.equalTo(colletionTitle.snp.bottom).offset(6)
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
        goalsTitle.snp.makeConstraints {
            $0.top.equalTo(categoryItemsTableViewController.mainVStack.snp.bottom).offset(8)
            $0.leading.equalTo(balanceCardView.view.snp.leading)
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(40)
        }
        addGoalButton.snp.makeConstraints {
            $0.top.equalTo(goalsTitle.snp.top)
            $0.trailing.equalTo(balanceCardView.view.snp.trailing)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        goalsTable.snp.makeConstraints {
            $0.top.equalTo(goalsTitle.snp.bottom).offset(-20)
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


extension HomeViewController: UITableViewDataSource, GoalsTableItemsService {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        goalsItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryItemTableViewCell.self), for: indexPath) as! CategoryItemTableViewCell
        cell.configure(with: goalsItems[indexPath.section])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}