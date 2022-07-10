//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, HomeBaseCoordinated, BindableType {
    var viewModel: HomeViewModel!
    var coordinator: HomeBaseCoordinator?

    let collectionDataSource = CategoriesCollectionDataSource()
    let collectionDelegate = CategoriesCollectionDelegate()

    private lazy var categoriesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        collection.dataSource = collectionDataSource
        collection.delegate = collectionDelegate
        return collection
    }()

    private var creditCardView = CreditCardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        configureView()
        add(creditCardView, frame: view.frame)
    }

    func bindViewModel() {

    }

    private func configureView() {
        [creditCardView.view].forEach(view.addSubview)
    }
    private func makeConstraints(){
        creditCardView.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(2)
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
