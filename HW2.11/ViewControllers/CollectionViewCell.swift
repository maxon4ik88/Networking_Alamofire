//
//  CollectionViewCell.swift
//  HW2.10
//
//  Created by Maxon on 23.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellView: UIView!
    
    override var isSelected: Bool {
        willSet(newValue) {
            let newColor = isSelected ? UIColor.black : UIColor.systemRed
            UIView.animate(withDuration: 0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.backgroundColor = newColor
            }, completion: { _ in
                print("Selected")
            })
        }
    }
}
