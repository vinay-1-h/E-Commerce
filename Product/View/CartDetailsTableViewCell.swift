//
//  CartDetailsTableViewCell.swift
//  Product
//
//  Created by Vinay on 19/01/24.
//

import UIKit
protocol CartDetailsDelegate {
    func tap(a: Double)
}

class CartDetailsTableViewCell: UITableViewCell{
    
    @IBOutlet weak var units: UILabel!
    
    var sum : Int = 01
    var profuctPrice: Double = 0.0
    var delegate: CartDetailsDelegate?
    
    var cartItemsPrice: [Double] = [] {
        didSet {
            updateSumLabel()
            cartTotalAmount()
        }
    }
    
    
    
    @IBOutlet weak var cartAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var cartName: UILabel!
    @IBOutlet weak var cartImg: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        updateSumLabel()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateSumLabel() {
        units.text = "\(sum)"
    }
    
    @IBAction func increase(_ sender: Any) {
        sum = sum + 1
        updateSumLabel()
        totalPriceUpdate()
        
    }
    
    @IBAction func decrease(_ sender: Any) {
        if sum > 0 {
            sum -= 1
            updateSumLabel()
            totalPriceUpdate()
            decreseAmount()
        } else { }
    }
    
    func decreseAmount() {
        cartItemsPrice.removeLast()
    }
    
    func totalPriceUpdate(){
        let res = profuctPrice * Double(sum)
        totalAmount.text = "\(res)"
        cartItemsPrice.append(res)
    }
    
    func cartTotalAmount()  {
        let c = cartItemsPrice.reduce(1, {$0 + $1 })
        delegate?.tap(a: c)
    }
}
