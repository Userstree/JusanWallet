//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

class CategoryTableView: UIViewController {

    private lazy var categoryTable: UITableView = {
        let table = UITableView()
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: String(describing: CategoryTableViewCell.self))
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init() {

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

extension CategoryTableView: UITableViewDelegate {

}