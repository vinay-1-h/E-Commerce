//
//  CartDetailsViewController.swift
//  Product
//
//  Created by Vinay on 19/01/24.
//

import UIKit

class CartDetailsViewController: UIViewController{
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cartTotalAmount: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var cartAmount: UILabel!
    @IBOutlet weak var cartTbl: UITableView!
    
    var total : [Double] = [Double]()
    var cardItems = [Carts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        updateUI()
        addDropShadow(to: backgroundView)
        PresentienceService.shared.fetch(Carts.self) { res in
            self.cardItems = res
        }
    }
    
    func addDropShadow(to view: UIView) {
        // Set shadow properties
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 3
        
        // Optionally, you can set the shadow path for performance optimization
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    
    func register() {
        let nib = UINib(nibName: "CartDetailsTableViewCell", bundle: nil)
        cartTbl.register(nib, forCellReuseIdentifier: "CartDetailsTableViewCell")
        
    }
    
    
    @IBAction func clodeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func updateUI() {
        UIView.animate(withDuration: 0.9, animations: {
            // Scale the button to make it smaller
            self.cartBtn.transform = CGAffineTransform(scaleX: 9.0, y: 9.8)
        }) { _ in
            // Bring the button back to its original size after the animation completes
            UIView.animate(withDuration: 0.9) {
                self.cartBtn.transform = .identity
            }
        }
    }
    
}

extension CartDetailsViewController :CartDetailsDelegate{
    func tap(a: Double) {
        let int = Int(a)
        let disc = Int(a) - 20
        cartAmount.text = "\(int)"
        cartTotalAmount.text = "\(disc)"
    }
}


extension CartDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartDetailsTableViewCell", for: indexPath) as? CartDetailsTableViewCell {
            cell.cartName.text = cardItems[indexPath.row].name
            let price = cardItems[indexPath.item].price
            cell.profuctPrice = price
            _ = NumberFormatter.localizedString(from: NSNumber(value: price), number: .none)
            cell.delegate = self
            cell.cartAmount.text = "INR \(price)"
            cell.totalAmount.text = "\( price)"
            if let url = cardItems[indexPath.item].img{
                let commonUrl = URL(string: url)
                if let data = try? Data(contentsOf: commonUrl!){
                    cell.cartImg.image = UIImage(data: data)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
