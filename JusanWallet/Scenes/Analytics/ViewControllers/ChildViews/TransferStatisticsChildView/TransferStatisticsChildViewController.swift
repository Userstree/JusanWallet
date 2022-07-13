//
// Created by Dossymkhan Zhulamanov on 13.07.2022.
//

import UIKit

final class TransferStatisticsChildViewController: UIViewController {
    var viewModel: AnalyticsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tintColor
    }

    init(viewModel: AnalyticsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
