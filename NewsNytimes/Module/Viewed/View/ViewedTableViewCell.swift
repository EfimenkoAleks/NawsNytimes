//
//  ViewedTableViewCell.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//
import UIKit

class ViewedTableViewCell: UITableViewCell {
 
    @IBOutlet weak var viewedLabel: UILabel!
    
    @IBOutlet weak var starButton: UIButton!
    
    weak var delegate: CellButtonDelegate?
    private var article: Articles?
    
    override func awakeFromNib() {
            super.awakeFromNib()
        self.backgroundColor = .clear
        let image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        self.starButton.contentEdgeInsets = .zero
        self.starButton.setImage(image, for: .normal)
        self.starButton.tintColor = .systemGray2
    }

    func configure(model: Articles) {
        self.viewedLabel.text = model.title
        self.article = model
    }
    
    @IBAction func starActionButton(_ sender: UIButton) {
        guard let id = self.article?.id else { return }
        self.delegate?.addFavourites(index: id)
    }
    
    
}
