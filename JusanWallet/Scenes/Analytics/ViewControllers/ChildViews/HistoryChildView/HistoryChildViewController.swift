//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit

final class HistoryChildViewController: UIViewController {
    var viewModel: AnalyticsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
    }

    init(viewModel: AnalyticsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
