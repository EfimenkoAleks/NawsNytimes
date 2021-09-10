//
//  SharedTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class SharedTableViewCell: UITableViewCell {
 
    @IBOutlet private weak var sharedTextLabel: UILabel!
    
    @IBOutlet private weak var statImageView: UIButton!
    
    weak var delegate: CellButtonDelegate?
    private var article: Articles?
    
    override func awakeFromNib() {
            super.awakeFromNib()
        self.backgroundColor = .gray

        let image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withRenderingMode(.alwaysTemplate)
        self.statImageView.contentEdgeInsets = .zero
        self.statImageView.setImage(image, for: .normal)
        self.statImageView.tintColor = .gray
    }

    func configure(model: Articles) {
        self.sharedTextLabel.text = model.title
        self.article = model
    }
    
    @IBAction private func actionButton(_ sender: UIButton) {
        guard let id = self.article?.id else { return }
        self.delegate?.addFavourites(index: id)
    }
    
}
