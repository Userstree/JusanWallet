//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

protocol CatalogItemsDataListProvidable {
    var companyData: [CatalogTableItemDataSource] { get set }
}

class CatalogItemsTableViewController: UIViewController {
    var dataSource: CatalogItemsDataList!

    lazy var companyTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CompanyItemTableViewCell.self, forCellReuseIdentifier: String(describing: CompanyItemTableViewCell.self))
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
        let stack = UIStackView(viewElements: [companyTable])
        stack.axis = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        view.addSubview(companyTable)
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

extension CatalogItemsTableViewController: UITableViewDelegate {
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

extension CatalogItemsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.companyData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompanyItemTableViewCell.self), for: indexPath) as! CompanyItemTableViewCell
        cell.configure(with: dataSource.companyData[indexPath.section])
        cell.backgroundColor = .clear
        return cell
    }
}