//
//  TouristViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class TouristViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    private var expandableNames = [
        ExpandableName(isExpanded: true),
        ExpandableName()
    ]

    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .grayBackgroundColor()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let touristStackView = UIStackView(
        spacing: 8,
        aligment: .fill,
        axis: .vertical,
        distribution: .fillProportionally
    )
    
    private let reservationView = ReservationNameView()
    
    private let reservationTableView = ReservationTableView()
    
    private let informationBayerView = InformationBayerView()
    
    private let informationTouristView = InformationTouristView()
    
    private let addButtonView = AddTouristView()
    
    private let totalView = TotalTableView()
    
    private lazy var selectedButton = UIButton(
        title: "К выбору номера",
        font: UIFont.mediumSFPro16()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        fetchInfoHostel()
    }

    private func setupComponents() {
        prepareView()
        setupViews()
        setupLayout()
        informationTouristView.configure(with: expandableNames)
        addButtonView.addTouristViewDelegate = self
    }
    
    private func prepareView() {
        title = "Бронирование"
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(touristStackView)
        touristStackView.addArrangedSubview(reservationView)
        touristStackView.addArrangedSubview(reservationTableView)
        touristStackView.addArrangedSubview(informationBayerView)
        touristStackView.addArrangedSubview(informationTouristView)
        touristStackView.addArrangedSubview(addButtonView)
        touristStackView.addArrangedSubview(totalView)
        view.addSubview(selectedButton)
    }
    
    private func configure(with model: InfoHostel) {
        reservationView.configure(with: model)
        reservationTableView.configure(with: model)
        totalView.configure(with: model)
    }
    
    private func fetchInfoHostel() {
        //Logger
        networkManager.fetch(InfoHostel.self, from: Link.infoHostel.url) { [weak self] result in
            switch result {
            case .success(let infoHostel):
                DispatchQueue.main.async {
                    self?.configure(with: infoHostel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension TouristViewController: AddTouristViewDelegate {
    func addNewExpanded() {
        let expandableName = ExpandableName()
        expandableNames.append(expandableName)
        informationTouristView.addNewExpandbleName(with: expandableName)
        let newSection = expandableNames.count - 1
        let newIndexPath = IndexSet(integer: newSection)
        print(newIndexPath)
        informationTouristView.insertSections(newIndexPath, with: .automatic)
    }
}

extension TouristViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            selectedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            selectedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectedButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: selectedButton.topAnchor, constant: -10)
        ])
        
        reservationView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        reservationTableView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        informationBayerView.heightAnchor.constraint(equalToConstant: 232).isActive = true
        informationTouristView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        addButtonView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        totalView.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        NSLayoutConstraint.activate([
            touristStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            touristStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            touristStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            touristStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
