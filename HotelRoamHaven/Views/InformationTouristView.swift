
//InfomationTouristView.swift
//HotelRoamHaven

//Created by Айдар Оспанов on 09.09.2023.


import UIKit

protocol InformationTouristViewProtocol: AnyObject {
    func contentSize(size: CGSize)
}

final class InformationTouristView: UITableView {
    
    weak var infoTouristDelegate: InformationTouristViewProtocol?
    
    private var tourist = Tourist()
    
    private var expandableNames: [ExpandableName] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        prepareView()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with expandableNames: [ExpandableName]) {
        self.expandableNames = expandableNames
        reloadData()
    }
    
    func addNewExpandbleName(with element: ExpandableName) {
        expandableNames.append(element)
    }
    
    func setupTourist(_ tourist: Tourist) {
        self.tourist = tourist
    }
    
    func getTourist() -> Tourist {
        getEditTourist()
        return tourist
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 12
        //rowHeight = 75
        register(
            TitleTextTableViewCell.self,
            forCellReuseIdentifier: TitleTextTableViewCell.identifier
        )
        register(
            TextTableViewCell.self,
            forCellReuseIdentifier: TextTableViewCell.identifier
        )
        print(contentSize)
    }
    
    private func setupDelegates() {
        dataSource = self
        delegate = self
    }
    
    private func getEditTourist() {
        guard let firstNameCell = cellForRow(at: IndexPath(row: 0, section: 0)) as? TitleTextTableViewCell,
              let lastNameCell = cellForRow(at: IndexPath(row: 1, section: 0)) as? TitleTextTableViewCell,
              let dateBirthdayCell = cellForRow(at: IndexPath(row: 2, section: 0)) as? TextTableViewCell,
              let nationalityCell = cellForRow(at: IndexPath(row: 3, section: 0)) as? TextTableViewCell,
              let passportIDCell = cellForRow(at: IndexPath(row: 4, section: 0)) as? TextTableViewCell,
              let validityCell = cellForRow(at: IndexPath(row: 5, section: 0))  as? TextTableViewCell else {
            return
        }
        tourist.firstName = firstNameCell.getCellValue()
        tourist.lastName = lastNameCell.getCellValue()
        tourist.dateBirthday = dateBirthdayCell.getValueCell()
        tourist.nationality = nationalityCell.getValueCell()
        tourist.passportID = passportIDCell.getValueCell()
        tourist.validity = validityCell.getValueCell()
    }
}

extension InformationTouristView: UITableViewDataSource {
    
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

extension InformationTouristView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
}

extension InformationTouristView: TestViewDelegate {
    func didTapped(tag: Int) {
        let section = tag
        let indexPathsToReload = expandableNames[section].names.indices
            .map { IndexPath(row: $0, section: section) }
        
        let isExpanded = !expandableNames[section].isExpanded
        expandableNames[section].isExpanded = isExpanded
        
        if isExpanded {
            insertRows(at: indexPathsToReload, with: .fade)
        } else {
            deleteRows(at: indexPathsToReload, with: .fade)
        }
        infoTouristDelegate?.contentSize(size: contentSize)
    }
}
