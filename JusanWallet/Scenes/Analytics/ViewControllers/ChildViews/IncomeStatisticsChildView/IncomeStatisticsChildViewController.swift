//
// Created by Dossymkhan Zhulamanov on 13.07.2022.
//

import UIKit
import Charts
import SnapKit

final class IncomeStatisticsChildViewController: UIViewController, RandomColorsMakeable {
    var viewModel: AnalyticsViewModel!
    private let categories = ["Income", "Expenses"]
    private lazy var rawData: [Double] = (0..<categories.count).map { _ -> Double in
        .random(in: 1000..<2340)
    }
    private lazy var pieChartView: PieChartView = {
        let chart = PieChartView(frame: .zero)
        chart.legend.enabled = false
        chart.rotationEnabled = false
        chart.drawHoleEnabled = false
        chart.holeRadiusPercent = 0.65
        chart.usePercentValuesEnabled = false
        chart.tintColor = .red

        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
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
        configureViews()
        setDataForChart(
                dataPoints: categories,
                values: rawData
        )
    }

    private func setDataForChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }

        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        pieChartDataSet.sliceSpace = 4
        pieChartDataSet.colors = colorsOfCharts(numberOfColors: dataPoints.count)

        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieChartView.data = pieChartData
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

extension IncomeStatisticsChildViewController: UITableViewDataSource, IncomesTableItemsService {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        incomeItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryItemTableViewCell.self), for: indexPath) as! CategoryItemTableViewCell
        cell.configure(with: incomeItems[indexPath.section])
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