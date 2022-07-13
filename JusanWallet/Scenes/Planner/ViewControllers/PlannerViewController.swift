//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

final class PlannerViewController: UIViewController, AccountBaseCoordinated {
    var coordinator: PlannerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavBar()
    }

    private func configureNavBar() {
        title = "Planner"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: PlannerCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
