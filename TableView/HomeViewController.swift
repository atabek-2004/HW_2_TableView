//
//  ViewController.swift
//  TableView
//
//  Created by Admin on 22.09.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var data: [TableViewModel] = [
        TableViewModel(title: "Item 1", description: "Description 1"),
        TableViewModel(title: "Item 2", description: "Description 2"),
        TableViewModel(title: "Item 3", description: "Description 3")
    ]
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViews()
    }
    func setViews(){
        view.addSubview(tableView)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}


extension HomeViewController {
    
    func navigateToDetailViewController(with item: TableViewModel) {
        let detailVC = DetailViewController()
        detailVC.item = item
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let item = data[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = data[indexPath.row]
        navigateToDetailViewController(with: selectedItem)
    }
}

