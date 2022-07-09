//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

protocol AuthCoordinatorOutput {
    var finishFlow: (() -> Void)? { get set }
}
