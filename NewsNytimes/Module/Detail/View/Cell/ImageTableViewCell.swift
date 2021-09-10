//
//  ImageTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet private weak var detailImageView: UIImageView!

    func configure(model: Data) {
        guard let image = UIImage(data: model) else { return }
        self.detailImageView.image = image
    }
}
