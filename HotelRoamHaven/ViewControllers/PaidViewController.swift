//
//  PaidViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 15.09.2023.
//

import UIKit

final class PaidViewController: UIViewController {
    
    //MARK: Private Properties
    private let backdropView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayBackgroundColor()
//        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.largeContentImage = UIImage(systemName: "person")
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            named: "party"
        )?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lineBorder: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayBackgroundColor().cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let orderLabel = UILabel(
        text: "Ваш заказ принят в работу",
        font: .mediumSFPro22(),
        textAlingment: .center
    )
    
    private let descriptionLabel = UILabel(
        text: "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
        font: .regularSFPro16(),
        textColor: .grayTextColor(),
        textAlingment: .center,
        numberOfLines: 0
    )
    
    private let superButton = UIButton(title: "Супер!", font: .mediumSFPro16())
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    override func viewDidLayoutSubviews() {
        backdropView.layer.cornerRadius = backdropView.frame.height / 2
    }
    
    //MARK: Private Methods
    private func prepareView() {
        title = "Заказ оплачен"
        view.backgroundColor = .white
        addSubviews(
            backdropView,
            lineBorder,
            orderLabel,
            descriptionLabel,
            superButton
        )
        setupLayout()
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        superButton.addTarget(self, action: #selector(superButtonTapped), for: .touchUpInside)
    }
    
    @objc private func superButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0)}
        backdropView.addSubview(imageView)
    }
}

//MARK: SetupLayout
extension PaidViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            orderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            orderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            orderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            backdropView.bottomAnchor.constraint(equalTo: orderLabel.topAnchor, constant: -40),
            backdropView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backdropView.heightAnchor.constraint(equalToConstant: 94),
            backdropView.widthAnchor.constraint(equalToConstant: 94),
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: backdropView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backdropView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 44),
            imageView.widthAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            superButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            superButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            superButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            superButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            lineBorder.bottomAnchor.constraint(equalTo: superButton.topAnchor, constant: -8),
            lineBorder.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
