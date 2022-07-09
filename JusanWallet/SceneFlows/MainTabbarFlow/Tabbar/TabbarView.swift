//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

protocol TabbarView: AnyObject {
    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
