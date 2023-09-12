//
//  PeculiaritiesCollectionViewCell.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class PeculiaritiesCollectionViewCell: UICollectionViewCell {
    
//    private let backView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .grayBackgroundColor()
//        view.layer.cornerRadius = 12
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let peculiarLabel = UILabel(
        text: "все включено",
        font: .mediumSFPro16(),
        textColor: .grayTextColor(),
        numberOfLines: 0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareView()
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with peculiarStr: String) {
        peculiarLabel.text = peculiarStr
    }
    
    private func prepareView() {
        layer.cornerRadius = 12
        backgroundColor = .grayBackgroundColor()
    }
    
    private func setupViews() {
       
        addSubview(peculiarLabel)
        //backView.addSubview(peculiarLabel)
    }
}

extension PeculiaritiesCollectionViewCell {
    private func setupLayout() {

        NSLayoutConstraint.activate([
            peculiarLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            peculiarLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
       
    }
}


