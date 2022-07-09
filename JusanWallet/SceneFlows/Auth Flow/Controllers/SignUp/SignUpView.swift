//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

protocol SignUpView: BaseView {
    var confirmed: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
}
