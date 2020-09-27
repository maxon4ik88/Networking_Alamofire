//
//  ExchangeTableViewCell.swift
//  HW2.10
//
//  Created by Maxon on 25.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {

    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var cellTextLabel: UILabel!
    @IBOutlet var cellImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
