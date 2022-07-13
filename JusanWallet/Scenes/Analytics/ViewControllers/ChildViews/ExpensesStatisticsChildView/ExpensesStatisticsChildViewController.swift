//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit
import SnapKit
import Charts

final class ExpensesStatisticsChildViewController: UIViewController, BindableType, RandomColorsMakeable {
    var viewModel: AnalyticsViewModel!
    private let categories = ["Education", "Shoping", "Entertainment", "Food&Drink", "Internet", "Transportation"]
    private lazy var rawData: [Double] = (0..<categories.count).map { _ -> Double in
        .random(in: 1..<234)
    }

    private var timeCollectionDelegate: MonthsCollectionDelegate!

    private lazy var monthsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MonthCollectionCell.self, forCellWithReuseIdentifier: String(describing: MonthCollectionCell.self))
        collection.backgroundColor = .background
        collection.dataSource = self
        collection.delegate = timeCollectionDelegate
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    private lazy var pieChartView: PieChartView = {
        let chart = PieChartView(frame: .zero)
        chart.drawEntryLabelsEnabled = false
        chart.rotationEnabled = false
        chart.holeRadiusPercent = 0.65
        let legend = chart.legend
        legend.verticalAlignment = .bottom
        legend.horizontalAlignment = .right
        legend.textColor = .onSurface
        legend.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        legend.form = .circle
        chart.usePercentValuesEnabled = false
        chart.tintColor = .red

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
        timeCollectionDelegate = MonthsCollectionDelegate()
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

    func bindViewModel() {

    }

    private func configureViews() {
        [monthsCollectionView,
         pieChartView,
         cotegoryTable,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        monthsCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(8)
            $0.leading.equalTo(view.snp.leading).offset(8)
            $0.trailing.equalTo(view.snp.trailing).offset(-8)
            $0.height.equalTo(32)
        }
        pieChartView.snp.makeConstraints {
            $0.top.equalTo(monthsCollectionView.snp.bottom)
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

    init(viewModel: AnalyticsViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExpensesStatisticsChildViewController: UICollectionViewDataSource {
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

extension ExpensesStatisticsChildViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = viewModel.monthsDataSource.months[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 30)
    }
}

extension ExpensesStatisticsChildViewController: UITableViewDataSource, CategoriesTableItemsService {
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

extension ExpensesStatisticsChildViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ExpensesStatisticsChildViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}