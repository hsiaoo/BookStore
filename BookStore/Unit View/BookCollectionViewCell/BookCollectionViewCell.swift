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
    
    /**更新Cell UI**/
    func updateUI(title: String, author: String)
    {
        imageView.image = UIImage(systemName: "book.closed")
        titleLabel.text = title
        authorLabel.text = author
    }
}

extension BookCollectionViewCell
{
    static var itemSize: CGSize =
    {
        let screenWidth = UIScreen.main.bounds.size.width
        let cellWidth = screenWidth * 142/375   // 螢幕寬*142/375，142/375來自figma
        let cellHeight = cellWidth * 245/142  // cell width*245/142，245/142來自figma
        return CGSize(width: cellWidth, height: cellHeight)
    }()
    
    static var libraryBooksItemSize: CGSize =
    {
        // cell width: (螢幕寬 - cell與鄰居的邊界距離25*3個距離) / 一列有2個cell，即可得到一個cell的寬
        // cell height: cell width*(Figma cell長192+17+36)/(Figma cell寬142)
        
        let cellSpacing: CGFloat = 25
        let cellWidth: CGFloat = (UIScreen.main.bounds.width - cellSpacing * 3) / 2
        let cellHeight = cellWidth*(192+17+36)/142
        return CGSize(width: cellWidth, height: cellHeight)
    }()
}
