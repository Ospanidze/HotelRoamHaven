//
//  ReservationTableView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 11.09.2023.
//

import UIKit

final class ReservationTableView: UITableView {
    
    private let names = OptionField.allCases
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
       
        values = [
            model.departure,
            model.arrivalCountry,
            "\(model.tourDateStart) - \(model.tourDateStop)",
            "\(model.numberOfNights)",
            model.hotelName,
            model.room,
            model.nutrition
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

extension ReservationTableView: UITableViewDataSource {
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
        
        cell.configure(with: name, text: value, isRight: false )
        return cell
    }
}

extension ReservationTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 5 ? UITableView.automaticDimension : 40
    }
}
