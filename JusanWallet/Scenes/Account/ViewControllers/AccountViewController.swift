//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

class AccountViewController: UIViewController, AccountBaseCoordinated {
    var coordinator: AccountCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        configureNavTitle()
    }

    private func configureNavTitle() {
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primaryColor
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    init(coordinator: AccountCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Account"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
