//
//  TitleTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func confugure(model: String) {
        self.titleLabel.text = model
    }
}
