//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit

extension UIView {
    func elevateView(shadowWidth: Int = 3, shadowHeight: Int = 3, withShadowRadius: Int = 4) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = CGFloat(withShadowRadius)
    }
}

extension UIView {
    func makeSmoothCorners(ofRadius: Int = 4) {
        layer.cornerCurve = .continuous
        layer.cornerRadius = CGFloat(ofRadius)
    }
}
