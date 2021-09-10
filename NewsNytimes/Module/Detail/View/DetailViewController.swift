//
//  DetailViewController.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: TitleTableViewCell.self)
            tableView.registerCell(type: AbstractTableViewCell.self)
            tableView.registerCell(type: ImageTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.separatorStyle = .none
            tableView.estimatedRowHeight = 40
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.delegate = self
        self.castomBarButton()
    }
    
    func castomBarButton() {
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem!.backBarButtonItem = backButton
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func didFetchData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = self.viewModel.item(by: indexPath.row) else {
            fatalError()
        }
        
        switch item {
        case .title(let title):
            guard let cell = tableView.dequeueCell(withType: TitleTableViewCell.self, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
            cell.confugure(model: title ?? "No title")
            return cell
        case .text(let text):
            guard let cell = tableView.dequeueCell(withType: AbstractTableViewCell.self, for: indexPath) as? AbstractTableViewCell else { return UITableViewCell() }
            cell.configure(model: text ?? "No text")
            return cell
        case .image(let url):
            guard let cell = tableView.dequeueCell(withType: ImageTableViewCell.self, for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
            cell.configure(model: url)
            return cell
        
        }
    }
}
