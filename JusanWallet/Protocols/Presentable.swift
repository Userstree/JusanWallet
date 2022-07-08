//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        self
    }
}
