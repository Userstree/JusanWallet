//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class HomeViewController: UIViewController, HomeBaseCoordinated {
    var coordinator: HomeBaseCoordinator?

    init(coordinator: HomeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Home"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
