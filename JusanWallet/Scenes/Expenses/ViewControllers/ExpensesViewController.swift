//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit

class ExpensesViewController: UIViewController, ExpensesBaseCoordinated, BindableType {
    var coordinator: ExpensesCoordinator?
    var viewModel: ExpensesViewModel!
    private var timeCollectionDataSource: TimeCollectionDataSource!
    private var timeCollectionDelegate: TimeCollectionDelegate!
    private var isStatisticsActive: Bool = true

    private lazy var statisticsButton: UIButton = {
        let button = UIButton()
        button.setTitle( "Statistics", for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(statisticsButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setTitle( "History", for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc private func historyButtonTapped() {

    }

    @objc private func statisticsButtonTapped() {

    }

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        configureNavTitle()
        timeCollectionDataSource = TimeCollectionDataSource(viewModel: viewModel)
        timeCollectionDelegate = TimeCollectionDelegate()
        configureViews()
    }

    private func configureViews() {
        [statisticsButton, historyButton].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        statisticsButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(6)
        }
        historyButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(6)

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
