//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

extension UIStackView {
    convenience init(viewElements: [UIView]) {
        self.init()
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        for element in viewElements {
            addArrangedSubview(element)
        }
    }
}
