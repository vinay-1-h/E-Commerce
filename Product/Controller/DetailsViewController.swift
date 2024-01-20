//
//  DetailsViewController.swift
//  Product
//
//  Created by Vinay on 12/01/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var closebtn: UIButton!
    @IBOutlet weak var detailsTableView: UITableView!
    
    var result = [Datas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         register()
        var res = PresentienceService.shared.fetch(Datas.self) { res in
           self.result = res
        }
    }
    

    @IBAction func dismiss(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    

    func register() {
        let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
        detailsTableView.register(nib, forCellReuseIdentifier: "DetailsTableViewCell")
        
    }
    
}

extension DetailsViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
            cell.detailsName.text = result[indexPath.row].name
            let price = result[indexPath.item].price
            let valueStr = NumberFormatter.localizedString(from: NSNumber(value: price), number: .none)
            cell.price.text = "INR \(valueStr)"
            
            if let url = result[indexPath.item].img{
                let commonUrl = URL(string: url)
                if let data = try? Data(contentsOf: commonUrl!){
                    cell.ima.image = UIImage(data: data)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
                result.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            PresentienceService.shared.context.delete(result[indexPath.row])
            PresentienceService.shared.saveContext()
            
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
    }
    
    func configurecell(inde: IndexPath) {
        
    }
}

