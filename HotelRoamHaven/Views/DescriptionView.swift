//
//  DescriptionView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 08.09.2023.
//

import UIKit

final class DescriptionView: UIView {
    
    private let nameLabel = UILabel(text: "Об Отеле", font: UIFont.mediumSFPro22())
    
    private let mainStackView = UIStackView()
    
    private let descriptionLabel = UILabel(
        text: "dasdasdfsfsfssfsdfafadfjdhfkjadfhakdfjhaksdjfhjsfhakfasdjf",
        font: UIFont.regularSFPro16(),
        numberOfLines: 0
    )
    
    private let descriptionTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    
    private func setupComponents() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTableView.rowHeight = 66
        addSubviews(
            nameLabel,
            mainStackView,
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
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
            mainStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.78),
            mainStackView.heightAnchor.constraint(equalToConstant: 66)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 76),
        ])
        
        NSLayoutConstraint.activate([
            descriptionTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            //descriptionTableView.heightAnchor.constraint(equalToConstant: 184)
        ])
    }
}
