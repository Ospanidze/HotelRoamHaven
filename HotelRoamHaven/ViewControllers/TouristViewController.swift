//
//  TouristViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class TouristViewController: UIViewController {

    var touristTabs: [InformationTouristView] = []
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Создаем UIScrollView и настраиваем его
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)

        // Создаем UIStackView внутри UIScrollView
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.frame = scrollView.bounds
        scrollView.addSubview(stackView)

        // Добавляем кнопку "Добавить туриста"
        addButton.setTitle("Добавить туриста", for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addButton.backgroundColor = .black
        addButton.addTarget(self, action: #selector(addTouristButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(addButton)

        // Добавляем первую вкладку "Первый турист"
        addTouristTab()
        setupLayout()
    }

    @objc func addTouristButtonTapped() {
        // Создаем и настраиваем новую вкладку
        let touristTab = InformationTouristView()
        touristTab.isHidden = true // Сначала скрываем новую вкладку
        stackView.addArrangedSubview(touristTab)
        touristTabs.append(touristTab)
        
        // Анимированно раскрываем новую вкладку
        UIView.animate(withDuration: 0.3) {
            touristTab.isHidden = false
        }
    }

    func addTouristTab() {

        // Создаем и настраиваем новую вкладку
        let touristTab = InformationTouristView()
        //touristTab.isHidden = false // По умолчанию видимая
        stackView.addArrangedSubview(touristTab)
        touristTabs.append(touristTab)
    }
    
    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
//            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            addButton.heightAnchor.constraint(equalToConstant: 34),
//            addButton.widthAnchor.constraint(equalToConstant: 100)
//        ])
    }
}
