//
//  ViewedViewController.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class ViewedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: ViewedTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    
    var viewModel: ViewedViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
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
        
        return cell
    }
    
    
}

extension ViewedViewController: UITableViewDelegate {
    
}
