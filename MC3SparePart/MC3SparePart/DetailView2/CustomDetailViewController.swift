//
//  CustomDetailViewController.swift
//  MC3SparePart
//
//  Created by Andhika Narendra Tama on 28/07/20.
//  Copyright © 2020 Andhika Narendra Tama. All rights reserved.
//

import UIKit

class CustomDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let codeSegmented = CustomDetailView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["OFF","HTTP","AUTO"])
        codeSegmented.backgroundColor = .clear
        codeSegmented.selectorViewColor = .green
        codeSegmented.selectorTextColor = .green
        view.addSubview(codeSegmented)
        
    }
    
}
