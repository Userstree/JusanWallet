//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

final class PlannerViewController: UIViewController, AccountBaseCoordinated {
    var coordinator: PlannerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavTitle()
    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primary
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: PlannerCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Planner"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
