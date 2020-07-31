//
//  DetailViewController.swift
//  MC3SparePart
//
//  Created by Andhika Narendra Tama on 21/07/20.
//  Copyright © 2020 Andhika Narendra Tama. All rights reserved.
//

import UIKit

struct DetailModel {
    var restaurantID: Int
    var category: String
    var resto_name: String
    var lat: Double
    var lng: Double
    var jam_buka: String
    var jam_tutup: String
    var schedule: [String]
    var price: String
    var price_group: String
    var address: String
    var contact: String
    var overview: String
    var history: String
    var fun_fact: String
    var rating: Double
    var image: UIImage
    var galery_images: [UIImage]
    
    init(restaurantID: Int,
         category: String,
         resto_name: String,
         lat: Double,
         lng: Double,
         jam_buka: String,
         jam_tutup: String,
         schedule: [String],
         price: String,
         price_group: String,
         address: String,
         contact: String,
         overview: String,
         history: String,
         fun_fact: String,
         rating: Double,
         image: UIImage,
         galery_images: [UIImage] ) {
        
        self.restaurantID = restaurantID
        self.category = category
        self.resto_name = resto_name
        self.lat = lat
        self.lng = lng
        self.jam_buka = jam_buka
        self.jam_tutup = jam_tutup
        self.schedule = schedule
        self.price = price
        self.price_group = price_group
        self.address = address
        self.contact = contact
        self.overview = overview
        self.history = history
        self.fun_fact = fun_fact
        self.rating = rating
        self.image = image
        self.galery_images = galery_images
    }
}

struct ReviewModel {
    var reviewID: Int
    var restaurantID: Int
    var rating: Int
    var review: String
    
    init(reviewID: Int, restaurantID: Int, rating: Int, review: String) {
        self.reviewID = reviewID
        self.restaurantID = restaurantID
        self.rating = rating
        self.review = review
    }
}

class DetailViewController: UIViewController {

    // Outlet
    @IBOutlet weak var detailSpace: UIView!
    @IBOutlet weak var detailSegment: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    
    var listOfDetail: [DetailModel] = []
    var listOfReview: [ReviewModel] = []
    
    // Section Title untuk table view
    let infoSectionHeader: [String] = ["Schedule", "Price", "Address", "Contact"]
    let aboutSectionHeader: [String] = ["Overview", "History", "Fun Fact"]
    
    // MARK: === START OF DATA INPUT ===
    // Untuk input data(sekarang masih dummy dulu)
    func inputData() {
        // Dummy
        for item in 1...6 {
            let tempData: DetailModel = DetailModel(restaurantID: item, category: "category", resto_name: "Sando Indonesia", lat:-6.935159, lng: 107.6356858, jam_buka: "09:00", jam_tutup: "13:00", schedule: ["Senin", "Selasa", "Minggu"], price: "Rp. 30.000 - Rp. 80.000", price_group: "$$$", address: "Jl. Taurus No. 56, Buah Batu, Bandung", contact: "08112160410", overview: "Sandwich Fussion Jepang", history: "Sando dibuat sejak 2020. Awalnya Sando dibuat karena adanya pandemi Corona. Berawal dari jatuh bangunnya Chef Ray untuk merintis bisnis-bisnis yang ada, akhirnya Chef Ray memutuskan untuk meninggalkan semuanya dan memilih untuk membuat @sando_indonesia", fun_fact: "-", rating: 4.0, image: #imageLiteral(resourceName: "dummyImage"), galery_images: [#imageLiteral(resourceName: "dummyImage"), #imageLiteral(resourceName: "dummyImage"), #imageLiteral(resourceName: "dummyImage")])
            
            listOfDetail.append(tempData)
        }
        
        
        for item in 1...5 {
            // restaurantID masuk disini                                           ???
            let tempReview: ReviewModel = ReviewModel(reviewID: item, restaurantID: 1, rating: item, review: "Bru pertama kali sih nyobain makan siang di sini. Tempatnya gampang banget dicari karena ada di pinggir jalan. Pelayannya juga jelasin ada promo apa aja bulan ini dan menu apa yang direkomendasiin")
            
            listOfReview.append(tempReview)
        }
        
        // Real
//        for item in JumlahDataDalamDatabasenya {
//            let tempData: DetailModel = DetailModel(restaurantID: <#T##Int#>, category: <#T##String#>, resto_name: <#T##String#>, lat: <#T##Double#>, lng: <#T##Double#>, jam_buka: <#T##String#>, jam_tutup: <#T##String#>, schedule: <#T##[String]#>, price: <#T##String#>, price_group: <#T##String#>, address: <#T##String#>, contact: <#T##String#>, overview: <#T##String#>, history: <#T##String#>, fun_fact: <#T##String#>, rating: <#T##Double#>, image: <#T##UIImage#>, galery_images: <#T##[UIImage]#>)
//
//            listOfDetail.append(tempData)
//        }
//
//        for item in JumlahDataDalamDatabasenya {
//            let tempReview: ReviewModel = ReviewModel(reviewID: <#T##Int#>, restaurantID: <#T##Int#>, rating: <#T##Int#>, review: <#T##String#>)
//
//            listOfReview.append(tempReview)
//        }
        
        
    }
    
    // MARK: === END OF DATA INPUT ===
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        detailSpace.layer.cornerRadius = 20
        
        // MARK: === START OF GESTURE RECOGNIZER ===
        // Left = 2
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        // Right = 1
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        // MARK: === END OF GESTURE RECOGNIZER ===
        
        
        inputData()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Untuk title dan informasinya, bintang adalah button
        // untuk distancenya ganti "let distance"
        let distance: Double = 7.2
        let restoID: Int = listOfDetail[0].restaurantID
        detailTitleLabel.text = listOfDetail[restoID].resto_name
        detailInfoLabel.text = String(format: "%.1f || %.1f || %@", listOfDetail[restoID].rating, distance, listOfDetail[restoID].price_group)
        
    }
   
    
    //MARK: === START OF SEGMENTED CONTROL ===
    @IBAction func selectedSegmentAction(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    //MARK: === Extra spices :) ===
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        //If swipe to the left
        if swipe.direction == .left && detailSegment.selectedSegmentIndex < 2 {
            detailSegment.selectedSegmentIndex += 1
        }
        //If swipe to the right
        else if swipe.direction == .right && detailSegment.selectedSegmentIndex > 0 {
            detailSegment.selectedSegmentIndex -= 1
        }
        
        tableView.reloadData()
    }
    //MARK: === END OF SEGMENTED CONTROL ===
    
}

// MARK: https://stackoverflow.com/a/48795672
// Sumber tertera
// Used on Address and About Segment
extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font as Any], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: === START OF TABLE VIEW LOGIC ===
    
    // Untuk mengembalikan nilai berapa banyak section dalam segment
    func segmentNumber(selected: Int) -> Int{
        var numberOfSection:Int!
        switch selected {
        case 0:
            numberOfSection = 4
        case 1:
            numberOfSection = 1
        case 2:
            numberOfSection = 3
        default:
            numberOfSection = 4
        }
        return numberOfSection
    }
    
    
    // Untuk mengetahui jumlah Section, setiap segment berbeda.
    func numberOfSections(in tableView: UITableView) -> Int {
        let selected: Int = detailSegment.selectedSegmentIndex
        let segment: Int = segmentNumber(selected: selected)
        //print(segment)
        return segment
    }
    
    // Untuk row per sectionnya. Selain review, hanya akan memiliki 1 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // review count harus diganti
        let selected: Int = detailSegment.selectedSegmentIndex
        let reviewCount: Int = listOfReview.count
        if section == 0 && segmentNumber(selected: selected) == 1 {
            //review
            return reviewCount
        } else {
            return 1
        }
    }
    
    // Untuk masing-masing Section Header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Untuk mengetahui Selected Segment
        let selected: Int = detailSegment.selectedSegmentIndex
        
        if selected == 0 {
            return infoSectionHeader[section]
        } else if selected == 2 {
            return aboutSectionHeader[section]
        } else {
            return ""
        }
    }
    
    // Untuk menampilkan data pada tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailData", for: indexPath)
        // MARK: ===== Tolong dirubah restoIDnya =====
        let restoID: Int = listOfDetail[0].restaurantID
        let selected: Int = detailSegment.selectedSegmentIndex
        
        if selected == 0 { // Info
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
            switch indexPath.section {
            case 0:
                cell.textLabel?.text = String(format: "%@ - %@", listOfDetail[restoID].schedule.first!, listOfDetail[restoID].schedule.last!)
                cell.detailTextLabel?.text = String(format: "%@ - %@", listOfDetail[restoID].jam_buka, listOfDetail[restoID].jam_tutup)
            case 1:
                cell.textLabel?.text = "\(listOfDetail[restoID].price)"
                cell.detailTextLabel?.text = ""
            case 2:
                cell.textLabel?.text = "\(listOfDetail[restoID].address)"
                cell.textLabel?.numberOfLines = cell.textLabel!.calculateMaxLines()
                cell.detailTextLabel?.text = "Open in Map"
            default:
                cell.textLabel?.text = "\(listOfDetail[restoID].contact)"
                cell.detailTextLabel?.text = ""
            }
        } else if selected == 2 { // About
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
            switch indexPath.section {
            case 0:
                cell.textLabel?.text = "\(listOfDetail[restoID].overview)"
                cell.textLabel?.numberOfLines = cell.textLabel!.calculateMaxLines()
                cell.detailTextLabel?.text = ""
            case 1:
                cell.textLabel?.text = "\(listOfDetail[restoID].history)"
                cell.textLabel?.numberOfLines = cell.textLabel!.calculateMaxLines()
                cell.detailTextLabel?.text = ""
            default:
                cell.textLabel?.text = "\(listOfDetail[restoID].fun_fact)"
                cell.detailTextLabel?.text = ""
            }
        } else { // Review
            // Maap, aku gk tau mau masukin rating dimana.
            // Tapi kalo mau buat custom view, disamain aj attributenya
            tableView.isScrollEnabled = true
            tableView.separatorStyle = .singleLine
            cell.textLabel?.text = "\(listOfReview[indexPath.row].review)"
            cell.textLabel?.numberOfLines = cell.textLabel!.calculateMaxLines()
            cell.textLabel?.frame.size.width = tableView.frame.size.width*4/5
            cell.detailTextLabel?.text = "\(listOfReview[indexPath.row].rating)"
        }
        
        return cell
    }
    
    
    
    // MARK: === END OF TABLE VIEW LOGIC ===
}
