//
//  ViewedTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//
import UIKit

class ViewedTableViewCell: UITableViewCell {
 
    @IBOutlet private weak var viewedLabel: UILabel!
    
    @IBOutlet private weak var starButton: UIButton!
    
    weak var delegate: CellButtonDelegate?
    private var article: Articles?
    
    override func awakeFromNib() {
            super.awakeFromNib()
        self.backgroundColor = .gray
        let image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withRenderingMode(.alwaysTemplate)
        self.starButton.contentEdgeInsets = .zero
        self.starButton.setImage(image, for: .normal)
        self.starButton.tintColor = .gray
    }

    func configure(model: Articles) {
        self.viewedLabel.text = model.title
        self.article = model
    }
    
    @IBAction private func starActionButton(_ sender: UIButton) {
        guard let id = self.article?.id else { return }
        self.delegate?.addFavourites(index: id)
    }
    
    
}
