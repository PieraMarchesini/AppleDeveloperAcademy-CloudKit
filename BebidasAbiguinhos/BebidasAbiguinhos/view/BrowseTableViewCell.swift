//
//  BrowseTableViewCell.swift
//  BebidasAbiguinhos
//
//  Created by Piera Marchesini on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import UIKit

class BrowseTableViewCell: UITableViewCell {

    @IBOutlet var category: UILabel!
    @IBOutlet var quantityOfBeverages: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
