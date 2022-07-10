//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

@IBDesignable
class DesignableViewController: UIViewController {

    @IBInspectable var LightStatusBar: Bool = false

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if LightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}