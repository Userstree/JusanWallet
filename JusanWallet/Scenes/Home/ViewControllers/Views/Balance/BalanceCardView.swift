//
// Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit
import SnapKit
import DropDown

class BalanceCardView: UIViewController {
    private lazy var totalBalanceTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Total balance"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private lazy var totalBalanceNumericLabel: UILabel = {
        let label = UILabel()
        label.text = "$12,530"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "KZT"
        label.textContainerInset = UIEdgeInsets(top: 4, left: 4, bottom: 2, right: 4)
        label.layer.cornerRadius = 6
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.layer.borderWidth = 0.4
        label.layer.borderColor = UIColor.black.cgColor
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(currencyButtonTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()

    private let currenciesList = ["USD", "KZT", "EU"]

    private lazy var dropDownView: DropDown = {
        let dropDown = DropDown()
        dropDown.dataSource = currenciesList
        dropDown.direction = .bottom
        dropDown.anchorView = currencyLabel
        return dropDown
    }()

    lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        view.backgroundColor = .white
        return view
    }()

    private lazy var statiscticsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 118, height: 144)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(StatisticsCollectionCell.self, forCellWithReuseIdentifier: String(describing: StatisticsCollectionCell.self))
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    @objc private func currencyButtonTapped(_ sender: UITapGestureRecognizer) {
        dropDownView.show()
    }

    private func configureViews() {
        [cardView,
         totalBalanceTextLabel,
         totalBalanceNumericLabel,
         currencyLabel,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        totalBalanceTextLabel.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.top).offset(16)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        totalBalanceNumericLabel.snp.makeConstraints {
            $0.top.equalTo(totalBalanceTextLabel.snp.bottom).offset(6)
            $0.left.equalTo(cardView.snp.left).offset(16)
        }
        currencyLabel.snp.makeConstraints{
            $0.leading.equalTo(totalBalanceNumericLabel.snp.trailing).offset(4)
            $0.bottom.equalTo(totalBalanceNumericLabel.snp.bottom).offset(-2)
        }
        cardView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(48)
            $0.leading.equalTo(view.snp.leading).offset(18)
            $0.trailing.equalTo(view.snp.trailing).offset(-18)
            $0.bottom.equalTo(totalBalanceNumericLabel.snp.bottom).offset(15)
        }
    }

    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        view.frame = frame
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) ")
    }
}
