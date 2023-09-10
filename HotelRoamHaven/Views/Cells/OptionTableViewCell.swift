//
//  OptionTableViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class OptionTableViewCell: UITableViewCell {
    
    static let identifier = "OptionTableViewCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel = UILabel(text: "sadasdd", font: .mediumSFPro16())
    private let secondaryTextLabel = UILabel(text: "Самое необходимое",
                                             font: .mediumSFPro14(),
                                             textColor: .grayTextColor())
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .grayBackgroundColor()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with option: Option) {
        titleLabel.text = option.title
        iconImageView.image = UIImage(systemName: option.imageString)?.withRenderingMode(.alwaysOriginal) ?? UIImage(named: option.imageString)
    }
    
    private func setupViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(secondaryTextLabel)
        addSubview(chevronImageView)
    }
}

extension OptionTableViewCell {
    private func setupLayout() {
        
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            iconImageView.heightAnchor.constraint(equalToConstant: 25),
            iconImageView.widthAnchor.constraint(equalToConstant: 25),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            
        ])
        
        NSLayoutConstraint.activate([
            secondaryTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            secondaryTextLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            chevronImageView.heightAnchor.constraint(equalToConstant: 20),
//            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
