//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

protocol CatalogItemsDataListProvidable {
    var catalogData: [CatalogTableItemDataSource] { get set }
}

extension CatalogItemsDataList {
    var catalogData: [CatalogTableItemDataSource] {
        get {
            let catalogTableItems: [CatalogTableItemDataSource] = [
                CatalogTableItem(title: "IPhone 13 mini", subTitle: "IPoint", amount: 799, logoImage: UIImage(systemName: "iphone")!),
                CatalogTableItem(title: "Sony Headphones", subTitle: "Sony Store", amount: 499, logoImage: UIImage(systemName: "headphones")!),
                CatalogTableItem(title: "Magic Mouse", subTitle: "IPoint", amount: 249, logoImage: UIImage(systemName: "magicmouse")!),
                CatalogTableItem(title: "Macbook Pro 14'", subTitle: "Apple", amount: 1799, logoImage: UIImage(systemName: "laptopcomputer")!),
            ]
            return catalogTableItems
        }
    }
}

class CatalogItemsTableView: UIViewController {
    var dataSource: CatalogItemsDataList!

    lazy var catalogTable: UITableView = {
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

    lazy var mainVStack: UIStackView = {
        let stack = UIStackView(viewElements: [catalogTable])
        stack.axis = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        view.addSubview(catalogTable)
        makeConstraints()
    }

    private func makeConstraints() {
        mainVStack.snp.makeConstraints {
            $0.edges.equalTo(view.snp.edges)
        }
    }

    init(dataSource: CatalogItemsDataList) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CatalogItemsTableView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(75)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(5)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension CatalogItemsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.catalogData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryItemTableViewCell.self), for: indexPath) as! CategoryItemTableViewCell
        cell.configure(with: dataSource.catalogData[indexPath.section])
        cell.backgroundColor = .clear
        return cell
    }
}