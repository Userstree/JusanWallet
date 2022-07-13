//
// Created by Dossymkhan Zhulamanov on 13.07.2022.
//

import UIKit

protocol RandomColorsMakeable {
    func colorsOfCharts(numberOfColors: Int) -> [UIColor]
}

extension RandomColorsMakeable {
    func colorsOfCharts(numberOfColors: Int) -> [UIColor] {
        var colors: [UIColor] = []
        var setOfColors: [UIColor] = [.red, .magenta, .orange, .blue, .purple, .brown, .systemMint]
        for _ in 0..<numberOfColors {
            let size = UInt32(setOfColors.count)
            let color = setOfColors.remove(at: Int(arc4random_uniform(size)) )
            colors.append(color)
        }
        return colors
    }
}
