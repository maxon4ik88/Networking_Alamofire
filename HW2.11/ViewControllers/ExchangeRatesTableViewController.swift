//
//  ExchangeRatesTableViewController.swift
//  HW2.10
//
//  Created by Maxon on 21.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//


import UIKit

class ExchangeRatesTableViewController: UITableViewController {
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var valutesList: CbrExchangeRates!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        NetworkManager.shared.getCurrencyList2(from: UrlLinks.cbrExchange.rawValue) { Value in
            self.valutesList = Value
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let valuteList = valutesList else { return 0 }
        guard let valute = valuteList.Valute else { return 0 }
        return valute.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExchangeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! ExchangeTableViewCell
        var testArrayName: [String] = []
        var testArrayValue: [Double] = []
        var testArrayPreviousValue: [Double] = []
        
        if valutesList.Valute != nil {
            let sortedValute = valutesList.Valute!.sorted(by: { $0.key < $1.key })
            for i in sortedValute {
                testArrayName.append(i.key)
                testArrayValue.append(i.value.Value!)
                testArrayPreviousValue.append(i.value.Previous!)
            }
        }
        
        cell.cellTextLabel.text = testArrayName[indexPath.row]
        cell.detailLabel.text = String(testArrayValue[indexPath.row])
        
        if testArrayValue[indexPath.row] < testArrayPreviousValue[indexPath.row] {
            cell.cellImageView.image = UIImage.init(named: "greenArrow")
        } else {
            cell.cellImageView.image = UIImage.init(named: "redArrow")
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let detailsVC = segue.destination as! DetailsExchangeViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            var testArrayShortName: [String] = []
            var testArrayName: [String] = []
            var testArrayValue: [Double] = []
            var testArrayPreviousValue: [Double] = []
            var testArrayNominal: [Int] = []
            
            if valutesList.Valute != nil {
                let sortedValute = valutesList.Valute!.sorted(by: { $0.key < $1.key })
                for i in sortedValute {
                    testArrayShortName.append(i.key)
                    testArrayName.append(i.value.Name!)
                    testArrayValue.append(i.value.Value!)
                    testArrayPreviousValue.append(i.value.Previous!)
                    testArrayNominal.append(i.value.Nominal!)
                }
            }
            
            detailsVC.shortName = testArrayShortName[indexPath.row]
            detailsVC.name = testArrayName[indexPath.row]
            detailsVC.value = testArrayValue[indexPath.row]
            detailsVC.previousValue = testArrayPreviousValue[indexPath.row]
            detailsVC.nominal = testArrayNominal[indexPath.row]
            
            
        }
        
    }
    
    
}
