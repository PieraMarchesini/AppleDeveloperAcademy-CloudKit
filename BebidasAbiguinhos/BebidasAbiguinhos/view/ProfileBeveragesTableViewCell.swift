//
//  ProfileBeveragesTableViewCell.swift
//  BebidasAbiguinhos
//
//  Created by Piera Marchesini on 05/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import UIKit

class ProfileBeveragesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBeverage: UIImageView!
    @IBOutlet weak var beverageName: UILabel!
    @IBOutlet weak var beverageCategory: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
