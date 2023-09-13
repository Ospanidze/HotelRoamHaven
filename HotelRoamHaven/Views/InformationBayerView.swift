//
//  InformationBayerView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class InformationBayerView: UIView {
    
    private let contacts = ["номер телефона", "почта"]
    
    private let titleLabel = UILabel(
        text: "Информация о покупателе",
        font: .mediumSFPro22()
    )
    
    private let informationTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(
            TitleTextTableViewCell.self,
            forCellReuseIdentifier: TitleTextTableViewCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let notificationLabel = UILabel(
        text: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
        font: .regularSFPro14(),
        textColor: .grayTextColor(),
        numberOfLines: 0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        preparaView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func preparaView() {
        backgroundColor = .white
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        informationTableView.dataSource = self
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(informationTableView)
        addSubview(notificationLabel)
    }
}

extension InformationBayerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleTextTableViewCell.identifier, for: indexPath)
        guard let cell = cell as? TitleTextTableViewCell else {
            return UITableViewCell()
        }
        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
}

extension InformationBayerView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            informationTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            informationTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationTableView.bottomAnchor.constraint(equalTo: notificationLabel.topAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            //notificationLabel.topAnchor.constraint(equalTo: informationTableView.bottomAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //numberTitleTextView.heightAnchor.constraint(equalToConstant: 52)
            notificationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
