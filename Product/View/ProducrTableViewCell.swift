//
//  ProducrTableViewCell.swift
//  Product
//
//  Created by Vinay on 10/01/24.
//

import UIKit

class ProducrTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionCell: UICollectionView!
    
    var selcetdProduc = [Datas]()
    var result : Welcome?
    var dataHandler =  DataHandler()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fetchData()
        register()
        DispatchQueue.main.async {
            self.collectionCell.reloadData()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func fetchData() {
        dataHandler.loadData { res in
            switch res {
            case .success(let data):
                DispatchQueue.main.async {
                    self.result = data
                    self.collectionCell.reloadData()
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func register() {
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionCell.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionCell.delegate = self
        collectionCell.dataSource = self
    }
}


extension ProducrTableViewCell:  UICollectionViewDelegate,
                                 UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180.0, height: 180.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.categories[collectionCell.tag].items.count ?? 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionCell.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell {
            cell.productName.text =  result?.categories[collectionCell.tag].items[indexPath.item].name
            let res = result?.categories[collectionCell.tag].items[indexPath.item].price
            let valueStr = NumberFormatter.localizedString(from: NSNumber(value: res!), number: .decimal)
            if collectionCell.tag == 0 {
                cell.price.text =  "\(valueStr)kg"
            } else if collectionCell.tag == 1 {
                cell.price.text =  "\(valueStr) /liter"
            }else{
                cell.price.text =  "\(valueStr) /Unit"
            }
            if let url = result?.categories[collectionCell.tag].items[indexPath.item].icon {
                
                let commonUrl = URL(string: url)
                if let data = try? Data(contentsOf: commonUrl!){
                    cell.image.image = UIImage(data: data)
                }
            }
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ =  result?.categories[collectionCell.tag].items[indexPath.item].name
        _ = result?.categories[collectionCell.tag].items[indexPath.item].price
        
        
        //Savig To Favorite
        let res =  Datas(context: PresentienceService.shared.context)
        res.name = result?.categories[collectionCell.tag].items[indexPath.item].name
        res.price = result?.categories[collectionCell.tag].items[indexPath.item].price ?? 0.0
        res.img =   result?.categories[collectionCell.tag].items[indexPath.item].icon
        PresentienceService.shared.saveContext()
        
        //Saving To Cart
        let car =  Carts(context: PresentienceService.shared.context)
        car.name = result?.categories[collectionCell.tag].items[indexPath.item].name
        car.price = result?.categories[collectionCell.tag].items[indexPath.item].price ?? 0.0
        car.img =   result?.categories[collectionCell.tag].items[indexPath.item].icon
        PresentienceService.shared.saveContext()
    }
}

