//
//  Test.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class RoomViewController: UIViewController {
    
    //private var heightConstaint: NSLayoutConstraint!
    private var isCellExpanded = false
    
    private var isInformationViewHidden = false
    
    private let informationBayerView = InformationBayerView()
    
    private let infornationTouristView = InformationTouristView()
    
    private let addTouristView = AddTouristView()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(TouristTableViewCell.self, forCellReuseIdentifier: TouristTableViewCell.identifier)
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        tableView.backgroundColor = .grayBackgroundColor()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .grayBackgroundColor()
        setupViews()
        setupLayout()
        infornationTouristView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 66
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 66 // Определите оценочную высоту
        
        // Выберите начальную высоту.
        //heightConstaint.constant = isInformationViewHidden ? 58 : 430
    }
    
    
    func configure(with title: String) {
        let truncatedString = String(title.prefix(20))
        self.title = truncatedString
    }
    
    private func setupViews() {
//        view.addSubview(informationBayerView)
//        view.addSubview(infornationTouristView)
//        view.addSubview(addTouristView)
        view.addSubview(tableView)
    }
}

extension RoomViewController: InformationTouristViewDelegate {
    func checkAnimation() {
        print("dasda")
        isInformationViewHidden.toggle()
        infornationTouristView.isChecking(isInformationViewHidden)
//        UIView.animate(withDuration: 0.3) {
//            self.heightConstaint.constant = self.isInformationViewHidden ? 58 : 430 // Выберите
//            self.view.layoutIfNeeded() // Обновите макет для выполнения анимации.
//        }
    }
}

extension RoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TouristTableViewCell.identifier, for: indexPath)
        guard let cell = cell as? TouristTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension RoomViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        //indexPath.row == 0 ? UITableView.automaticDimension : 430
//        //return isCellExpanded ? 58 : 430
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isCellExpanded = !isCellExpanded
//        tableView.beginUpdates()
//        tableView.endUpdates()
//    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 { // Проверка на вашу особую логику, если есть
//            UIView.animate(withDuration: 0.3, animations: {
//                cell.contentView.layoutIfNeeded()
//            })
//        }
//    }

}

extension RoomViewController {
    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            informationBayerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            informationBayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            informationBayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            informationBayerView.heightAnchor.constraint(equalToConstant: 232)
//        ])
        
//        heightConstaint = NSLayoutConstraint(item: infornationTouristView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 430)
//        infornationTouristView.addConstraint(heightConstaint)
//
//        NSLayoutConstraint.activate([
//            infornationTouristView.topAnchor.constraint(equalTo: informationBayerView.bottomAnchor, constant: 8),
//            infornationTouristView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            infornationTouristView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            //infornationTouristView.heightAnchor.constraint(equalToConstant: 430)
//        ])
        
//        NSLayoutConstraint.activate([
//            addTouristView.topAnchor.constraint(equalTo: infornationTouristView.bottomAnchor, constant: 8),
//            addTouristView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            addTouristView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            addTouristView.heightAnchor.constraint(equalToConstant: 58),
//        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

