//
//  MainUITabViewController.swift
//  HW2.10
//
//  Created by Maxon on 21.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class MainUITabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HELLO!")


    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let exchangeVC = segue.destination as! ExchangeRatesTableViewController
        exchangeVC.getCurrencyList()
    }

}
