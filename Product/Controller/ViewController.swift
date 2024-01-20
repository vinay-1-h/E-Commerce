//
//  ViewController.swift
//  Product
//
//  Created by Vinay on 10/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cartbtn: UIButton!
    @IBOutlet weak var favoritebtn: UIButton!
    @IBOutlet weak var profilebtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataHandler =  DataHandler()
    var result: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button()
        register()
        fetechData()
    }
    
    @IBAction func navigationTOSelelctedPage(_ sender: Any) {
        favoritescreen()
    }
    
    @IBAction func cartDetals(_ sender: Any) {
        favoritescreen()
    }
    
    @IBAction func deatails(_ sender: Any) {
        cartscreen()
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let res = result{
            return res.categories.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if result != nil{
            return 1
        }
        return  0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProducrTableViewCell", for: indexPath) as? ProducrTableViewCell {
            cell.result = result
            // cell.foof(a: result!)
            cell.backgroundColor =
                .red
            cell.collectionCell.tag = indexPath.section
            //cell.conf(a: result!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.categories[section].name
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
}

extension ViewController {
    
    func register() {
        let nib = UINib(nibName: "ProducrTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProducrTableViewCell")
    }
    
    func button() {
        UIView.animate(withDuration: 0.9, animations: {
            // Scale the button to make it smaller
            self.profilebtn.transform = CGAffineTransform(scaleX: 9.0, y: 9.8)
        }) { _ in
            // Bring the button back to its original size after the animation completes
            UIView.animate(withDuration: 0.9) {
                self.profilebtn.transform = .identity
            }
        }
        
        UIView.animate(withDuration: 0.9, animations: {
            // Scale the button to make it smaller
            self.favoritebtn.transform = CGAffineTransform(scaleX: 9.0, y: 9.8)
        }) { _ in
            // Bring the button back to its original size after the animation completes
            UIView.animate(withDuration: 0.9) {
                self.favoritebtn.transform = .identity
            }
        }
        
        UIView.animate(withDuration: 0.9, animations: {
            // Scale the button to make it smaller
            self.cartbtn.transform = CGAffineTransform(scaleX: 9.0, y: 9.8)
        }) { _ in
            // Bring the button back to its original size after the animation completes
            UIView.animate(withDuration: 0.9) {
                self.cartbtn.transform = .identity
            }
        }
        profilebtn.tintColor = .white
        profilebtn.layer.cornerRadius = 20
        profilebtn.layer.masksToBounds = true
        
        favoritebtn.tintColor = .white
        favoritebtn.layer.cornerRadius = 20
        favoritebtn.layer.masksToBounds = true
        
        cartbtn.tintColor = .white
        cartbtn.layer.cornerRadius = 20
        cartbtn.layer.masksToBounds = true
    }
    
    func favoritescreen() {
        let vc = (UIStoryboard(name: "DetailsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
        present(vc, animated: true)
    }
    
    func cartscreen() {
        let vc = (UIStoryboard(name: "CartDetailsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartDetailsViewController") as? CartDetailsViewController)!
        present(vc, animated: true)
    }
    
    func fetechData() {
        dataHandler.loadData { res in
            switch res {
            case .success(let data):
                DispatchQueue.main.async {
                    self.result = data
                    self.tableView.reloadData()
                }
            case .failure(_):
                print("error")
            }
        }
    }
}
