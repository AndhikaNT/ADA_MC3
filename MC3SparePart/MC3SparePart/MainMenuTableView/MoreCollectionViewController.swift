//
//  MoreCollectionViewController.swift
//  MC3SparePart
//
//  Created by Andhika Narendra Tama on 22/07/20.
//  Copyright © 2020 Andhika Narendra Tama. All rights reserved.
//

import UIKit

struct StoreModel {
    var restaurantID: Int
    var storeTitle: String
    var storeRating: Double
    var storeDistance: Double
    var storePriceRange: Int
    var storeImage: UIImage
    
    init(restaurantID: Int, storeTitle: String, storeRating: Double, storeDistance: Double, storePriceRange: Int, storeImage: UIImage) {
        self.restaurantID = restaurantID
        self.storeTitle = storeTitle
        self.storeRating = storeRating
        self.storeDistance = storeDistance
        self.storePriceRange = storePriceRange
        self.storeImage = storeImage
    }
}

class MoreCollectionViewController: UIViewController {
    // *(butuh untuk memasukan delegate dan dataSource dari class extension)
    @IBOutlet weak var tableView: UITableView!
    
    // Untuk simpan data yang akan ditampilkan dalam TableView
    var listOfStore: [StoreModel] = []
    
    // Untuk input data(sekarang masih dummy dulu)
    func inputData() {
        // Dummy
        for item in 1...6 {
            listOfStore.append(StoreModel(restaurantID: item, storeTitle: "Dummy Title \(item)", storeRating: Double(item), storeDistance: Double(item), storePriceRange: item, storeImage: #imageLiteral(resourceName: "dummyImage")))
        }
        
        // Real
//        for item in (Databasenya) {
//            listOfStore.append(StoreModel(restaurantID: <#T##Int#>, storeTitle: <#T##String#>, storeRating: <#T##Double#>, storeDistance: <#T##Double#>, storePriceRange: <#T##Int#>, storeImage: <#T##UIImage#>)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        inputData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MoreCollectionViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: === START OF TABLE VIEW LOGIC ===
    
    // Untuk jumlah section/judul(jika ada) dalam table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Untuk generate berapa banyak cell yang akan di tampilkan (per Section --> lihat numberOfSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStore.count
    }
    
    // Untuk title dari Section Header
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    // Untuk isian cellnya
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let store = listOfStore[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoCell") as! StoreContentCell
        
        cell.setContent(storeModel: store)
        cell.cellFormating()
        return cell
    }
    
    // Untuk aksi selanjutnya jika cell di pilih/pencet
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedStore = listOfStore[indexPath.row]
//
//        performSegue(withIdentifier: "toDetailPageSegue", sender: selectedStore)
        //print(indexPath.row)
    }
    
    // MARK: === END OF TABLE VIEW LOGIC ===
}
