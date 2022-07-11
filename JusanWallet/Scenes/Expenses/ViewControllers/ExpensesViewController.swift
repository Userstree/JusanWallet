//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class ExpensesViewController: UIViewController, ExpensesBaseCoordinated {
    var coordinator: ExpensesCoordinator?
    private var timeCollectionDataSource: TimeCollectionDataSource!
    private var timeCollectionDelegate: TimeCollectionDelegate!

    private lazy var timeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TimeCollectionCell.self, forCellWithReuseIdentifier: String(describing: TimeCollectionCell.self))
        collection.dataSource = timeCollectionDataSource
        collection.delegate = timeCollectionDelegate
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        configureNavTitle()
    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primaryColor
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: ExpensesCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Expenses"
        let timeCollectionDataSource = TimeCollectionDataSource(viewModel: :)
        let timeCollectionDelegate = TimeCollectionDelegate()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
