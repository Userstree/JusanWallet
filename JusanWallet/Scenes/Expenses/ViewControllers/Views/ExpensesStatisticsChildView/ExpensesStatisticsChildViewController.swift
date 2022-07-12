//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit
import SnapKit
import Charts
import Persei
import SwipeMenuViewController

final class ExpensesStatisticsChildViewController: UIViewController, BindableType {
    var viewModel: ExpensesViewModel!
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
        timeCollectionDataSource = TimeCollectionDataSource(viewModel: viewModel)
        timeCollectionDelegate = TimeCollectionDelegate()
        view.backgroundColor = .red
        configureViews()
    }

    func bindViewModel() {

    }

    private func configureViews() {
        [timeCollectionView].forEach(view.addSubview)
        makeConstraints()
    }
    private func makeConstraints() {
        timeCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(8)
            $0.leading.equalTo(view.snp.leading).offset(8)
            $0.trailing.equalTo(view.snp.trailing).offset(-8)
            $0.height.equalTo(32)
        }
    }

    init(viewModel: ExpensesViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
