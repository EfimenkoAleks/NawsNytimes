//
//  AbstractTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import UIKit

class AbstractTableViewCell: UITableViewCell {

    @IBOutlet private weak var abstractLabel: UILabel!

    func configure(model: String) {
        self.abstractLabel.text = model
    }
    
}
