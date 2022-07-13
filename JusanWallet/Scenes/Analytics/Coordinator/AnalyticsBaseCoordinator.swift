//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import Foundation

protocol AnalyticsBaseCoordinator: Coordinator {  }

protocol AnalyticsBaseCoordinated {
    var coordinator: AnalyticsCoordinator? { get }
}