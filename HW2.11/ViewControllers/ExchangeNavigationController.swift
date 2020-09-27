//
//  ExchangeNavigationController.swift
//  HW2.10
//
//  Created by Maxon on 21.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class ExchangeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "toValutes", sender: nil)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toValutes" {
            _ = segue.destination as! ExchangeRatesTableViewController
        } else {
            print(segue.identifier ?? "ss")
        }
    }


}
