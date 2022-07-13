//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit

final class HistoryChildViewController: UIViewController {
    var viewModel: HomeViewModel!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        print(viewModel.companyCards[0])
        configureViews()
    }

    private func configureViews() {
        [companiesCollection,
         companyTitle,
         categoryItemsTableViewController.mainVStack,
        ].forEach(view.addSubview)
        makeConstraints()
    }
    private func makeConstraints() {
        companiesCollection.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(140)
        }
//        companyTitle.snp.makeConstraints {
//            $0.top.equalTo(companiesCollection.snp.bottom).offset(16)
//            $0.leading.equalTo(view.snp.leading).offset(16)
//            $0.width.equalTo(view.snp.width)
//            $0.height.equalTo(40)
//        }
//        categoryItemsTableViewController.mainVStack.snp.makeConstraints {
//            $0.top.equalTo(companyTitle.snp.bottom).offset(8)
//            $0.width.equalTo(companyTitle.snp.width)
//            $0.centerX.equalTo(view.snp.centerX)
//            $0.height.equalTo(400)
//        }
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryChildViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.companyCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CompaniesCell.self),
                for: indexPath) as! CompaniesCell
        cell.configure(with: viewModel.companyCards[indexPath.section])
        return cell
    }
}

extension HistoryChildViewController: UICollectionViewDelegate {  }