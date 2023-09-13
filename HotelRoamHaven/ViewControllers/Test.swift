//
//  Test.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class RoomViewController: UIViewController {
    
    private var tourists: [Tourist] = []
    //private var tourist = Tourist()
    
    private var expandableNames = [
        ExpandableName(isExpanded: true),
        ExpandableName()
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            TitleTextTableViewCell.self,
            forCellReuseIdentifier: TitleTextTableViewCell.identifier
        )
        tableView.register(
            TextTableViewCell.self,
            forCellReuseIdentifier: TextTableViewCell.identifier
        )
        tableView.separatorStyle = .none
        tableView.backgroundColor = .grayBackgroundColor()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let addButtonView = AddTouristView()
    
    private lazy var selectedButton = UIButton(
        title: "К выбору номера",
        font: UIFont.mediumSFPro16()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .grayBackgroundColor()
        setupViews()
        setupLayout()
        tableView.dataSource = self
        tableView.delegate = self
        addButtonView.addTouristViewDelegate = self
        tableView.rowHeight = 70
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 8
        }
        selectedButton.addTarget(self, action: #selector(selectedButtonTapped), for: .touchUpInside)
        setupTourists()
    }
    
    private func setupTourists() {
        expandableNames.indices.forEach { _ in
            let tourist = Tourist()
            tourists.append(tourist)
        }
    }
    
    private func getEditTourist() {
        expandableNames.indices.forEach { index in
            guard let firstNameCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: index)) as? TitleTextTableViewCell,
                  let lastNameCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: index)) as? TitleTextTableViewCell,
                  let dateBirthdayCell = self.tableView.cellForRow(at: IndexPath(row: 2, section: index)) as? TextTableViewCell,
                  let nationalityCell = self.tableView.cellForRow(at: IndexPath(row: 3, section: index)) as? TextTableViewCell,
                  let passportIDCell = self.tableView.cellForRow(at: IndexPath(row: 4, section: index)) as? TextTableViewCell,
                  let validityCell = self.tableView.cellForRow(at: IndexPath(row: 5, section: index))  as? TextTableViewCell else {
                return
            }
            
            tourists[index].firstName = firstNameCell.getCellValue()
            tourists[index].lastName = lastNameCell.getCellValue()
            tourists[index].dateBirthday = dateBirthdayCell.getValueCell()
            tourists[index].nationality = nationalityCell.getValueCell()
            tourists[index].passportID = passportIDCell.getValueCell()
            tourists[index].validity = validityCell.getValueCell()
        }
    }
//    
    func getTourists() -> [Tourist] {
        getEditTourist()
        return tourists
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(addButtonView)
        view.addSubview(selectedButton)
    }
    
    private func authFields(tourist: Tourist) -> Bool {
        if tourist.firstName == ""
            || tourist.lastName == ""
            || tourist.dateBirthday == ""
            || tourist.nationality == ""
            || tourist.passportID == ""
            || tourist.validity == "" {
            return false
        }
        return true
    }
    
    @objc private func selectedButtonTapped() {
        let tourists = getTourists()
        //let tourist = tourists[0]
        
        print(tourists[0])
        print(tourists[1])
//        if authFields(tourist: tourist) {
//            print("good")
//        } else {
//            print("not good")
//        }
    }
}

extension RoomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        expandableNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !expandableNames[section].isExpanded {
            return 0
        }
        
        return expandableNames[section].names.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let isExpanded = expandableNames[section].isExpanded
        let testView = HeaderView()
        testView.setupButton(section: section, isExpanded: isExpanded)
        testView.testViewDelegate = self
        return testView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = expandableNames[indexPath.section].names[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTextTableViewCell.identifier, for: indexPath)
            guard let cell = cell as? TitleTextTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: name)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.identifier, for: indexPath)
            guard let cell = cell as? TextTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: name)
            return cell
        }
    }
}

extension RoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
}

extension RoomViewController: TestViewDelegate {
    func didTapped(tag: Int) {
        let section = tag
        var indexPathsToReload: [IndexPath] = []
        
        expandableNames[section].names.indices.forEach { row in
            print(section, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPathsToReload.append(indexPath)
        }
        
        print(indexPathsToReload)
        let isExpanded = !expandableNames[section].isExpanded
        expandableNames[section].isExpanded = isExpanded
        
        if isExpanded {
            tableView.insertRows(at: indexPathsToReload, with: .fade)
        } else {
            tableView.deleteRows(at: indexPathsToReload, with: .fade)
        }
    }
}

extension RoomViewController: AddTouristViewDelegate {
    func addNewExpanded() {
        let expandableName = ExpandableName()
        expandableNames.append(expandableName)
        let newTourist = Tourist()
        print(newTourist)
        tourists.append(newTourist)
        let newSection = expandableNames.count - 1
        let newIndexPath = IndexSet(integer: newSection)
        print(newIndexPath)
        tableView.insertSections(newIndexPath, with: .automatic)
        
    }
}

extension RoomViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            selectedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            selectedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectedButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            addButtonView.bottomAnchor.constraint(equalTo: selectedButton.topAnchor, constant: -8),
            //tableView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            addButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addButtonView.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButtonView.topAnchor, constant: -8),
            //tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 430),
        ])
        
        
        
        
    }
}
