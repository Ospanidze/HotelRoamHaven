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
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 50)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .grayBackgroundColor()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = contentSize
        scrollView.alwaysBounceVertical = true
        scrollView.isDirectionalLockEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var selectedButton = UIButton(
        title: "К выбоору номера",
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
    }
    
    private func setupComponents() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleCollectionImageView)
        contentView.addSubview(descriptionView)
        view.addSubview(selectedButton)
        setupLayout()
    }
    
    private func setupHostelModel(_ hostel: Hostel) {
        titleCollectionImageView.configure(with: hostel)
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
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        //navigationController?.navigationBar.tintColor = .white
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
        
        NSLayoutConstraint.activate([
            titleCollectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCollectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleCollectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleCollectionImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: titleCollectionImageView.bottomAnchor, constant: 5),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionView.heightAnchor.constraint(equalTo: titleCollectionImageView.heightAnchor),
            //descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
