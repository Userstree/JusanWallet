//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

final class PaymentsParentViewController: UIViewController, PaymentsBaseCoordinated {
    var coordinator: PaymentsCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavBar()
    }

    private func configureNavBar() {
        title = "Payments"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: PaymentsCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
