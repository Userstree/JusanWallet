//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

final class SignUpController: UIViewController, SignUpView {

    var onSignUpComplete: (() -> Void)?

    @IBOutlet weak var signUpButton: UIButton!

    var confirmed = false {
        didSet {
            signUpButton.isEnabled = confirmed
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SignUp"
        termsLabel.isHidden = true
        signUpButton.isEnabled = false
    }

    @IBAction func signUpClicked(_ sender: AnyObject) {
        if confirmed {
            onSignUpComplete?()
        }
    }

    @IBAction func termsButtonClicked(_ sender: AnyObject) {
        onTermsButtonTap?()
    }

    func conformTermsAgreement(_ agree: Bool) {
        confirmed = agree
    }
}
