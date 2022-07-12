//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit

class HistoryViewController: UIViewController {
    var viewModel: ExpensesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(viewModel: ExpensesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
