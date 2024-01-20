//
//  DetailsTableViewCell.swift
//  Product
//
//  Created by Vinay on 18/01/24.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ima: UIImageView!
    @IBOutlet weak var detailsName: UILabel!
    @IBOutlet weak var detailsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.shadow(s: 8)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension UIView {
    
    func shadow(s: CGFloat) {
        layer.cornerRadius = s
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
