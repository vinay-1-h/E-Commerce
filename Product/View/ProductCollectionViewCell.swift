//
//  ProductCollectionViewCell.swift
//  Product
//
//  Created by Vinay on 10/01/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favotiBtn: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var image: UIImageView!
   
    static let identifier = "ProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}


