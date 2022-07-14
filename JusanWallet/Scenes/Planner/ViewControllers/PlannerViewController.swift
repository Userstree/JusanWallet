//
// Created by Dossymkhan Zhulamanov on 10.07.2022.
//

import UIKit

final class PlannerViewController: UIViewController, AccountBaseCoordinated, BindableType {
    var coordinator: PlannerCoordinator?
    var viewModel: PlannerViewModel!

    private lazy var plannerTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Планирование Бюджета"
        label.textColor = .onBackground
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        return label
    }()

    lazy var plannerTable: UITableView = {
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

//    private lazy var filterButton

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        configureNavBar()
        configureViews()
    }

    private func configureNavBar() {
        let configureButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(addGoalButtonTapped))
        configureButton.tintColor = .onPrimary
        navigationItem.rightBarButtonItem = configureButton
        title = "Planner"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    @objc private func addGoalButtonTapped() {
        print("Search button tapped")
    }

    private func configureViews() {
        [plannerTable,
         plannerTitle,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        plannerTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(16)
        }

        plannerTable.snp.makeConstraints {
            $0.top.equalTo(plannerTitle.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }

    init(coordinator: PlannerCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func bindViewModel() {
    }
}

extension PlannerViewController: UITableViewDataSource, CategoriesTableItemsService {
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

extension PlannerViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
