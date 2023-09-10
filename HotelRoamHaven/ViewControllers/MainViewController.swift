//
//  ViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 07.09.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    private var hostel: Hostel?
    
    private let mainStackView = UIStackView(spacing: 8, aligment: .fill, axis: .vertical, distribution: .fillEqually)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .grayBackgroundColor()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.layoutIfNeeded()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var selectedButton = UIButton(
        title: "К выбору номера",
        font: UIFont.mediumSFPro16()
    )
    
    private let titleCollectionImageView = TitleCollectionImageView()
    private let descriptionView = DescriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupComponents()
        setupNavigationBar()
        fetchHostel()
        
        selectedButton.addTarget(
            self,
            action: #selector(selectedButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func selectedButtonTapped() {
        guard let hostel = hostel else { return }
        let vc = RoomListViewController()
        vc.configure(with: hostel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupComponents() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleCollectionImageView)
        mainStackView.addArrangedSubview(descriptionView)
        view.addSubview(selectedButton)
        setupLayout()
    }
    
    private func setupHostelModel(_ hostel: Hostel) {
        self.hostel = hostel
        titleCollectionImageView.configure(with: hostel)
        descriptionView.configure(with: hostel)
    }
    
    private func fetchHostel() {
        networkManager.fetch(Hostel.self, from: Link.hostel.url) { result in
            switch result {
            case .success(let hostel):
                DispatchQueue.main.async {
                    self.setupHostelModel(hostel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension MainViewController {
    private func setupNavigationBar() {
        title = "Отель"
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.font: UIFont.mediumSFPro18() as Any]
        //navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .white
        
        navigationController?.navigationBar.barStyle = .default
        //navigationController?.navigationBar.standardAppearance = navBarAppearance
        //navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backgroundColor = .white
    }
}

extension MainViewController {
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
        
        titleCollectionImageView.heightAnchor.constraint(equalToConstant: 430).isActive = true
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
