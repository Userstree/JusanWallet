//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

class HomeViewController: DesignableViewController, HomeBaseCoordinated, BindableType {
    var viewModel: HomeViewModel!
    var coordinator: HomeBaseCoordinator?
    private lazy var balanceCardView = BalanceCardView(frame: .zero, dataSource: viewModel)

    private lazy var collectionDataSource = CategoriesCollectionDataSource(viewModel: viewModel)
    private let collectionDelegate = CategoriesCollectionDelegate()

    private lazy var categoriesCollection: UICollectionView = {
        let collection = CategoriesCollectionView()
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        collection.dataSource = collectionDataSource
        collection.delegate = collectionDelegate
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        balanceCardView.view.isUserInteractionEnabled = true
        configureNavBar()
        configureViews()
    }

    private func configureNavBar() {
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        let notifications = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationsButtonTapped))
        search.tintColor = .white
        notifications.tintColor = .white
        navigationItem.rightBarButtonItems = [search, notifications]
        title = "Home"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
    }

    @objc private func searchButtonTapped() {
        print("Search button tapped")
    }

    @objc private func notificationsButtonTapped() {
        print("Search button tapped")
    }

    func bindViewModel() {

    }

    private func configureViews() {
        [balanceCardView.view,
         categoriesCollection,
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
        categoriesCollection.snp.makeConstraints {
            $0.top.equalTo(balanceCardView.view.snp.bottom).offset(20)
            $0.width.equalTo(balanceCardView.mainHStack.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(140)
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
