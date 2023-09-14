//
//  RoomListViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class RoomListViewController: UIViewController {
    
    //MARK: Private Properties
    private let networkManager = NetworkManager.shared

    private var rooms: [Room] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(PeculiarTableViewCell.self, forCellReuseIdentifier: PeculiarTableViewCell.identifier)
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        tableView.backgroundColor = .grayBackgroundColor()
        tableView.rowHeight = 547
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        setupDelegates()
        fetchMotel()
    }
    
    //MARK: Public/Internal Methods
    func configure(with hostel: Hostel?) {
        guard let title = hostel?.name else { return }
        let truncatedString = String(title.prefix(20))
        self.title = truncatedString
        //self.title  = hostel?.name
    }
    
    //MARK: Private Methods
    private func setupDelegates() {
        tableView.dataSource = self
        //tableView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func fetchMotel() {
        networkManager.fetch(Motel.self, from: Link.motel.url) { result in
            switch result {
            case .success(let motel):
                self.rooms = motel.rooms
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    deinit {
        print("view controller dead")
    }
}

//MARK: - UITableViewDataSource
extension RoomListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeculiarTableViewCell.identifier, for: indexPath)
        guard let cell = cell as? PeculiarTableViewCell else {
            return UITableViewCell()
        }
        
        cell.peculiarDelegate = self
        let room = rooms[indexPath.row]
        cell.configure(with: room)
        return cell
    }
}

//MARK: - PeculiarTableViewCellDelegate
extension RoomListViewController: PeculiarTableViewCellDelegate {
    func cellButtonTapped() {
        let vc = TouristViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: SetupLayout
extension RoomListViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
