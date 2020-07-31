//
//  StoreContentCell.swift
//  MC3SparePart
//
//  Created by Andhika Narendra Tama on 23/07/20.
//  Copyright © 2020 Andhika Narendra Tama. All rights reserved.
//

import UIKit

class StoreContentCell: UITableViewCell {
    
    @IBOutlet weak var cellStoreImage: UIImageView!
    @IBOutlet weak var cellStoreTitle: UILabel!
    @IBOutlet weak var cellStoreRating: UILabel!
    @IBOutlet weak var cellStoreDetail: UILabel!
    @IBOutlet weak var cellStoreShadow: UIView!
    
    func cellFormating() {
        cellStoreImage.layer.cornerRadius = 15
        cellStoreShadow.layer.cornerRadius = 15
        cellStoreShadow.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner] // Swift 4+ & iOS 11+ only
    }
    
    func setContent(storeModel: StoreModel) {
        cellStoreImage.image = storeModel.storeImage
        cellStoreTitle.text = storeModel.storeTitle
        cellStoreRating.text = "\(String(storeModel.storeRating))"
        cellStoreDetail.text = "\(String(storeModel.storeDistance)) || \(String(storeModel.storePriceRange))"
    }
}
