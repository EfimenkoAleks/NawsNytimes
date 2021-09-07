//
//  MainViewController.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: MainTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemTeal
    }

}

extension MainViewController: MainViewModelDelegate {
    func didFetchData() {
        self.tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: MainTableViewCell.self, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let model = self.viewModel.itemForTable(index: indexPath.row)
        cell.configure(text: model)
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {}
