//
//  BookCollectionViewCell.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
    
    func updateUI(title: String, author: String)
    {
        titleLabel.text = title
        authorLabel.text = author
    }
}
