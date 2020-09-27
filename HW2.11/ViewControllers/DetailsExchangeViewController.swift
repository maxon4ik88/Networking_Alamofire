//
//  DetailsExchangeViewController.swift
//  HW2.10
//
//  Created by Maxon on 22.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class DetailsExchangeViewController: UIViewController {
    
    @IBOutlet var shortNameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var previousValueLabel: UILabel!
    
    var shortName: String!
    var name: String!
    var value: Double!
    var previousValue: Double!
    var nominal: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shortNameLabel.text = shortName
        nameLabel.text = "'\(name!)'"
        valueLabel.text = "\(nominal!) \(name!) = \(String(value))₽"
        previousValueLabel.text = "\(nominal!) \(name!) = \(previousValue!)₽"
    }
}
