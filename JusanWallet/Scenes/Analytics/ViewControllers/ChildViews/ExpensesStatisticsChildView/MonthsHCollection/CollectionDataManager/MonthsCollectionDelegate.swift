//
// Created by Dossymkhan Zhulamanov on 11.07.2022.
//

import UIKit

class MonthsCollectionDelegate: NSObject, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

    }
}
