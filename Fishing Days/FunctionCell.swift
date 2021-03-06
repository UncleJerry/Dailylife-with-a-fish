//
//  FunctionCell.swift
//  Fishing Days
//
//  Created by 周建明 on 2017/5/25.
//  Copyright © 2017年 Uncle Jerry. All rights reserved.
//

import UIKit

class FunctionCell: GeneralCollectionCell {
    
    @IBOutlet weak var FunctionName: UILabel!
    @IBOutlet weak var FunctionIcon: UIImageView!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var FunctionButton: FunctionButton!
    
    // MARK: - public API
    var function: Feature! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        FunctionName.text = function.name
        FunctionIcon.image = function.icon
        Description.text = function.description
        FunctionButton.command = function.navigation
    }
    
    
}
