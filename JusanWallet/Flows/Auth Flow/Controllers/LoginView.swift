//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation

protocol LoginView: BaseView {
    var onCompleteAuth: (() -> Void)? { get set }
    var onSignUpButtonTap: (() -> Void)? { get set }
}
