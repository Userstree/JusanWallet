//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

final class PaymentsParentViewController: UIViewController, PaymentsBaseCoordinated {
    private(set) var coordinator: PaymentsCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavTitle()
    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        appearance.backgroundColor = .primary
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: PaymentsCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Payments"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
