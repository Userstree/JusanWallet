//
// Created by Dossymkhan Zhulamanov on 13.07.2022.
//

import UIKit
import Charts
import SnapKit

final class IncomeStatisticsChildViewController: UIViewController {
    var viewModel: AnalyticsViewModel!

    private lazy var pieChartView: PieChartView = {
        let chart = PieChartView(frame: .zero)
        chart.drawEntryLabelsEnabled = false
        chart.rotationEnabled = false
        chart.holeRadiusPercent = 0.65

        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center

        let totalSpendingAttribures = [NSAttributedString.Key.foregroundColor: UIColor.onSurface,
                                       NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                       NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        var totalSpendingCenterText = NSMutableAttributedString(string: "Total Spending", attributes: totalSpendingAttribures)

        let amountAttribures = [NSAttributedString.Key.foregroundColor: UIColor.onSurface,
                                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
                                NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        var amountCenterText = NSAttributedString(string: " \(Int.random(in: 1001 ..< 2234))", attributes: amountAttribures)
        totalSpendingCenterText.append(amountCenterText)
        chart.centerAttributedText = totalSpendingCenterText
        chart.holeColor = .clear
        return chart
    }()

    lazy var cotegoryTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CategoryItemTableViewCell.self, forCellReuseIdentifier: String(describing: CategoryItemTableViewCell.self))
        table.dataSource = self
        table.delegate = self
        table.showsVerticalScrollIndicator = false
        table.layer.cornerRadius = 16
        table.layer.cornerCurve = .continuous
        table.layer.shadowColor = UIColor.black.cgColor
        table.layer.shadowOffset = CGSize(width: 3, height: 3)
        table.layer.shadowOpacity = 0.7
        table.layer.shadowRadius = 4
        table.backgroundColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    }

    private func configureViews() {
        [pieChartView,
         cotegoryTable,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        pieChartView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(8)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(324)
        }
        cotegoryTable.snp.makeConstraints {
            $0.top.equalTo(pieChartView.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    init(viewModel: AnalyticsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension IncomeStatisticsChildViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.monthsDataSource.months.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MonthCollectionCell.self), for: indexPath) as! MonthCollectionCell
        cell.configure(with: viewModel.monthsDataSource.months[indexPath.item])
        cell.backgroundColor = .surface
        cell.contentView.makeSmoothCorners(ofRadius: 6)
        cell.layer.masksToBounds = true
        return cell
    }
}

extension IncomeStatisticsChildViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = viewModel.monthsDataSource.months[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 30)
    }
}

extension IncomeStatisticsChildViewController: UITableViewDataSource, CategoriesTableItemsService {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        categoryItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryItemTableViewCell.self), for: indexPath) as! CategoryItemTableViewCell
        cell.configure(with: categoryItems[indexPath.section])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension IncomeStatisticsChildViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension IncomeStatisticsChildViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}