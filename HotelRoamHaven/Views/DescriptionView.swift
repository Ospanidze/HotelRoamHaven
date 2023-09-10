//
//  DescriptionView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 08.09.2023.
//

import UIKit

final class DescriptionView: UIView {
    private let options = Option.getOptions()
    
    private let nameLabel = UILabel(text: "Об Отеле", font: UIFont.mediumSFPro22())
    
    private var mainStackView = UIStackView()
    
    private let firstTextLabel = UILabel(
        text: "String",
        font: .mediumSFPro16(),
        textColor: .grayTextColor(),
        textAlingment: .center,
        backColor: .grayBackgroundColor(),
        numberOfLines: 0
    )
    
    private let secondTextLabel = UILabel(
        text: "String",
        font: .mediumSFPro16(),
        textColor: .grayTextColor(),
        textAlingment: .center,
        backColor: .grayBackgroundColor(),
        numberOfLines: 0
        
    )
    
    private let thridTextLabel = UILabel(
        text: "String",
        font: .mediumSFPro16(),
        textColor: .grayTextColor(),
        textAlingment: .center,
        backColor: .grayBackgroundColor(),
        numberOfLines: 0
    )
    
    private let fourthTextLabel = UILabel(
        text: "String",
        font: .mediumSFPro16(),
        textColor: .grayTextColor(),
        textAlingment: .center,
        backColor: .grayBackgroundColor(),
        numberOfLines: 0
    )
    
    private let descriptionLabel = UILabel(
        text: "dasdasdfsfsfssfsdfafadfjdhfkjadfhakdfjhaksdjfhjsfhakfasdjf",
        font: UIFont.regularSFPro16(),
        numberOfLines: 0
    )
    
    private let descriptionTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            OptionTableViewCell.self,
            forCellReuseIdentifier: OptionTableViewCell.identifier
        )
        tableView.rowHeight = 60
        tableView.backgroundColor = .grayBackgroundColor()
        tableView.layer.cornerRadius = 10
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 12
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Hostel) {
        descriptionLabel.text = model.aboutTheHotel.description
        firstTextLabel.text = model.aboutTheHotel.peculiarities[0]
        secondTextLabel.text = model.aboutTheHotel.peculiarities[1]
        thridTextLabel.text = model.aboutTheHotel.peculiarities[2]
        fourthTextLabel.text = model.aboutTheHotel.peculiarities[3]
    }
    
    private func setupComponents() {
        //descriptionTableView.rowHeight = 44
        addSubviews(
            nameLabel,
            firstTextLabel,
            secondTextLabel,
            thridTextLabel,
            fourthTextLabel,
            descriptionLabel,
            descriptionTableView
            )
        setupLayout()
        descriptionTableView.dataSource = self
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension DescriptionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: OptionTableViewCell.identifier,
            for: indexPath
        )
        guard let cell = cell as? OptionTableViewCell else {
            return UITableViewCell()
        }
        let option = options[indexPath.row]
        
        cell.configure(with: option)
        return cell
    }
}

extension DescriptionView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            firstTextLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            firstTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstTextLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.5)
            //firstTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            secondTextLabel.topAnchor.constraint(equalTo: firstTextLabel.topAnchor),
            //firstTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //firstTextLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            secondTextLabel.leadingAnchor.constraint(equalTo: firstTextLabel.trailingAnchor, constant: 5),
            secondTextLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            thridTextLabel.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 10),
            thridTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thridTextLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            fourthTextLabel.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 10),
            fourthTextLabel.leadingAnchor.constraint(equalTo: thridTextLabel.trailingAnchor, constant: 16),
            fourthTextLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: fourthTextLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //descriptionLabel.heightAnchor.constraint(equalToConstant: 76),
        ])
        
        NSLayoutConstraint.activate([
            descriptionTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //descriptionTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            //descriptionTableView.heightAnchor.constraint(equalToConstant: 184)
            descriptionTableView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.4)
        ])
    }
}
