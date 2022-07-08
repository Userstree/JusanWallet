//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//

import Foundation


protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginView
    func makeSignUpHandler() -> SignUpView
}
