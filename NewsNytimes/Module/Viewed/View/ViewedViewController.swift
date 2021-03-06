//
//  ViewedViewController.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class ViewedViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: ViewedTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.rowHeight = 60
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var viewModel: ViewedViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray5
    }

}

extension ViewedViewController: ViewedViewModelDelegate {
    func didFetchData() {
        self.tableView.reloadData()
    }
}

extension ViewedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countEmails
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueCell(withType: ViewedTableViewCell.self, for: indexPath) as? ViewedTableViewCell else { return UITableViewCell() }
        
        let model = self.viewModel.itemForTable(index: indexPath.row)
        cell.configure(model: model)
        cell.delegate = self
        
        return cell
    }
}

extension ViewedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.goToDetail(index: indexPath.row)
    }
}

extension ViewedViewController: CellButtonDelegate {
    
    func addFavourites(index: Double) {
        self.viewModel.addToFavourites(id: index)
    }
}
