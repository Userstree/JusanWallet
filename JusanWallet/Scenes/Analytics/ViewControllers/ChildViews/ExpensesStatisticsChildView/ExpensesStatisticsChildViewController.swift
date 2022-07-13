//
// Created by Dossymkhan Zhulamanov on 12.07.2022.
//

import UIKit
import SnapKit
import Charts

final class ExpensesStatisticsChildViewController: UIViewController, BindableType, RandomColorsMakeable {
    var viewModel: AnalyticsViewModel!
    private var timeCollectionDataSource: TimeCollectionDataSource!
    private var timeCollectionDelegate: TimeCollectionDelegate!

    private lazy var timeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TimeCollectionCell.self, forCellWithReuseIdentifier: String(describing: TimeCollectionCell.self))
        collection.dataSource = timeCollectionDataSource
        collection.delegate = timeCollectionDelegate
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    private lazy var pieChartView: PieChartView = {
        let chart = PieChartView()
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
        
        let monthAttribures = [NSAttributedString.Key.foregroundColor: UIColor.onSurface,
                               NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                               NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        var monthCenterText = NSAttributedString(string: "", attributes: monthAttribures)
        totalSpendingCenterText.append(monthCenterText)

        chart.centerAttributedText = totalSpendingCenterText
        chart.holeColor = .clear
        return chart
    }()

    private let categories = ["Education", "Shoping", "Entertainment", "Food&Drink", "Internet", "Transportation"]
    private lazy var rawData: [Double] = (0..<categories.count).map { _ -> Double in
        .random(in: 1..<234)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        timeCollectionDataSource = TimeCollectionDataSource(viewModel: viewModel)
        timeCollectionDelegate = TimeCollectionDelegate()
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
        [timeCollectionView, pieChartView].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        timeCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(8)
            $0.leading.equalTo(view.snp.leading).offset(8)
            $0.trailing.equalTo(view.snp.trailing).offset(-8)
            $0.height.equalTo(32)
        }
        pieChartView.snp.makeConstraints {
            $0.top.equalTo(timeCollectionView.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(324)
        }
    }

    init(viewModel: AnalyticsViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func colorsOfCharts(numberOfColors: Int) -> [UIColor] {
//
//    }
}
