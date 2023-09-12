
//InfomationTouristView.swift
//HotelRoamHaven

//Created by Айдар Оспанов on 09.09.2023.


import UIKit

final class InformationTouristView: UITableView {
    
    private var expandableNames = [
        ExpandableNames(isExpanded: true),
        ExpandableNames()
    ]
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        prepareView()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        backgroundColor = .grayBackgroundColor()
        layer.cornerRadius = 12
        rowHeight = 75
        register(
            TitleTextTableViewCell.self,
            forCellReuseIdentifier: TitleTextTableViewCell.identifier
        )
        register(
            TextTableViewCell.self,
            forCellReuseIdentifier: TextTableViewCell.identifier
        )
    }
    
    private func setupDelegates() {
        dataSource = self
        delegate = self
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
        let testView = TestView()
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
}

extension InformationTouristView: TestViewDelegate {
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
            insertRows(at: indexPathsToReload, with: .fade)
        } else {
            deleteRows(at: indexPathsToReload, with: .fade)
        }
    }
}
