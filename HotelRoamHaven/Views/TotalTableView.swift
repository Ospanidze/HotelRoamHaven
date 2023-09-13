//
//  TotalTableView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 13.09.2023.
//

import UIKit

final class TotalTableView: UITableView {
    
    private let names = Price.allCases
    private var values: [String] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        prepareView()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: InfoHostel) {
        let sum = model.tourPrice + model.fuelCharge + model.serviceCharge
        
        values = [
            "\(model.tourPrice)",
            "\(model.fuelCharge)",
            "\(model.serviceCharge)",
            "\(sum)"
        ]
        reloadData()
    }
    
    private func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        layer.cornerRadius = 12
        register(
            ReservationTableViewCell.self,
            forCellReuseIdentifier: ReservationTableViewCell.identifier
        )
    }
    
    private func setupDelegates() {
        delegate = self
        dataSource = self
    }
}

extension TotalTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReservationTableViewCell.identifier, for: indexPath)
        
        guard let cell = cell as? ReservationTableViewCell else {
            return UITableViewCell()
        }
        let name = names[indexPath.row].rawValue
        let value = values[indexPath.row]
        
        cell.configure(with: name, text: value, isRight: true)
        return cell
    }
}

extension TotalTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 5 ? UITableView.automaticDimension : 40
    }
}

