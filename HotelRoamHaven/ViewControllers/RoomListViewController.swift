//
//  RoomListViewController.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 09.09.2023.
//

import UIKit

final class RoomListViewController: UIViewController {
    
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
    
        view.backgroundColor = .white
        setupViews()
        setupLayout()
        setupDelegates()
       
    }
    
    
    func configure(with title: String) {
        let truncatedString = String(title.prefix(20))
        self.title = truncatedString
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
}



extension RoomListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeculiarTableViewCell.identifier, for: indexPath)
        guard let cell = cell as? PeculiarTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension RoomListViewController: UITableViewDelegate {

}

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
