//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

class CompaniesCollectionDelegate: NSObject, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

    }
}
