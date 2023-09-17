//
//  DescriptionView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 08.09.2023.
//

import UIKit

final class DescriptionView: UIView {
    
    //MARK: Private Properties
    private let options = Option.getOptions()
    
    private let nameLabel = UILabel(text: "Об Отеле", font: UIFont.mediumSFPro22())
    
    private let descriptionLabel = UILabel(
        text: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
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
    
    private let peculiaritiesCollectionView = PeculiaritiesCollectionView()
    
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
    
    //MARK: Public Methods
    func configure(with model: Hostel) {
        descriptionLabel.text = model.aboutTheHotel.description
        peculiaritiesCollectionView.configure(with: model)
    }
    
    //MARK: Private Methods
    private func setupComponents() {
        //descriptionTableView.rowHeight = 44
        addSubviews(
            nameLabel,
            peculiaritiesCollectionView,
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

//MARK: - UITableViewDataSource
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

//MARK: SetupLayout
extension DescriptionView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            peculiaritiesCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            peculiaritiesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            peculiaritiesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            peculiaritiesCollectionView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: peculiaritiesCollectionView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //descriptionLabel.heightAnchor.constraint(equalToConstant: 76),
        ])
        
        NSLayoutConstraint.activate([
            descriptionTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            //descriptionTableView.heightAnchor.constraint(equalToConstant: 184)
//            descriptionTableView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.4)
        ])
    }
}
