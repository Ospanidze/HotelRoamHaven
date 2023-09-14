//
//  TouristViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class TouristViewController: UIViewController {
    
    //MARK: Private Properties
    private lazy var height: NSLayoutConstraint = {
        let height = NSLayoutConstraint(item: informationTouristView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 500)
        return height
    }()
    
    private let networkManager = NetworkManager.shared
    
    private var expandableNames = [
        ExpandableName(isExpanded: true),
        //ExpandableName()
    ]
    
    private var tourist = Tourist()
    
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
    
    private lazy var payButton = UIButton(
        title: "К выбору номера",
        font: UIFont.mediumSFPro16()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        fetchInfoHostel()
    }
    
    //MARK: Private Methods
    private func setupComponents() {
        prepareView()
        setupViews()
        setupLayout()
        informationTouristView.configure(with: expandableNames)
        addButtonView.addTouristViewDelegate = self
        //height.constant = informationTouristView.contentSize.height
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)

        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true) // Закрыть клавиатуру
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func prepareView() {
        title = "Бронирование"
        view.backgroundColor = .white
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        informationTouristView.setupTourist(tourist)
    }
    
    @objc private func payButtonTapped() {
        let edtingTourist = informationTouristView.getTourist()
        print(edtingTourist)
        if authFields(tourist: edtingTourist) {
            let vc = PaidViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            presentAlert(title: "Ошибка", message: "Заполните вся поля имя, фамилия, дата рождения и тп.")
        }
    }
    
    private func authFields(tourist: Tourist) -> Bool {
        if tourist.firstName == ""
            || tourist.lastName == ""
            || tourist.dateBirthday == ""
            || tourist.nationality == ""
            || tourist.passportID == ""
            || tourist.validity == "" {
            return false
        }
        return true
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
        view.addSubview(payButton)
    }
    
    private func configure(with model: InfoHostel) {
        reservationView.configure(with: model)
        reservationTableView.configure(with: model)
        totalView.configure(with: model)
        let sum = model.fuelCharge + model.serviceCharge + model.tourPrice
        payButton.setTitle("Оплатить \(sum) ₽", for: .normal)
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

//MARK: - AddTouristViewDelegate
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

//MARK: SetupLayout
extension TouristViewController {
    private func setupLayout() {
        
        informationTouristView.addConstraint(height)
        
        NSLayoutConstraint.activate([
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            payButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -10)
        ])
        
        reservationView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        reservationTableView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        informationBayerView.heightAnchor.constraint(equalToConstant: 232).isActive = true
        //informationTouristView.heightAnchor.constraint(equalToConstant: 500).isActive = true
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
