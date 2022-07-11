//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

class HomeViewController: DesignableViewController, HomeBaseCoordinated, BindableType {
    var viewModel: HomeViewModel!
    var coordinator: HomeBaseCoordinator?
    private lazy var balanceCardView = BalanceCardView(frame: .zero, dataSource: viewModel)

    private lazy var collectionDataSource = CatalogsCollectionDataSource(viewModel: viewModel)
    private let collectionDelegate = CatalogsCollectionDelegate()

    private lazy var catalogsCollection: UICollectionView = {
        let collection = CatalogsCollectionView()
        collection.register(CatalogCell.self, forCellWithReuseIdentifier: String(describing: CatalogCell.self))
        collection.dataSource = collectionDataSource
        collection.delegate = collectionDelegate
        return collection
    }()

    private lazy var categoryItemsTable = CatalogItemsTableView(dataSource: viewModel.catalogData)

    private lazy var catalogTitle: UILabel = {
        let label = UILabel()
        label.text = viewModel.catalogCards[0].title
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        balanceCardView.view.isUserInteractionEnabled = true
        configureNavBar()
        configureViews()
    }

    private func configureNavBar() {
        let notifications = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationsButtonTapped))
        notifications.tintColor = .white
        navigationItem.rightBarButtonItem = notifications
        title = "Home"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
    }

    @objc private func notificationsButtonTapped() {
        print("Search button tapped")
    }

    func bindViewModel() {

    }

    private func configureViews() {
        [balanceCardView.view,
         catalogsCollection,
         catalogTitle,
         categoryItemsTable.mainVStack,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        balanceCardView.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(balanceCardView.mainHStack.snp.height)
            $0.width.equalTo(view.snp.width).offset(-32)
        }
        catalogsCollection.snp.makeConstraints {
            $0.top.equalTo(balanceCardView.view.snp.bottom).offset(20)
            $0.width.equalTo(balanceCardView.mainHStack.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(140)
        }
        catalogTitle.snp.makeConstraints {
            $0.top.equalTo(catalogsCollection.snp.bottom).offset(16)
            $0.leading.equalTo(balanceCardView.view.snp.leading)
        }
        categoryItemsTable.mainVStack.snp.makeConstraints {
            $0.top.equalTo(catalogTitle.snp.bottom).offset(16)
            $0.width.equalTo(balanceCardView.mainHStack.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.bottom.equalTo(view.snp.bottom)
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
