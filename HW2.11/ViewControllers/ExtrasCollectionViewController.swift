//
//  ExtrasCollectionViewController.swift
//  HW2.10
//
//  Created by Maxon on 22.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class ExtrasCollectionViewController: UICollectionViewController {
    
    private var ipScreenState = false
    private var dogImageState = false
    private var userActions = UserActions.allCases
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExtrasDetails" && ipScreenState == true {
            let extrasDetVC = segue.destination as! DetailsExtrasViewController
            extrasDetVC.ipScreen = true
            extrasDetVC.dogScreen = false
            print("TRUE \(ipScreenState)")
        } else if segue.identifier == "toExtrasDetails" && ipScreenState == false {
            let extrasDetVC = segue.destination as! DetailsExtrasViewController
            extrasDetVC.dogScreen = true
            extrasDetVC.ipScreen = false
            print("FALSE \(ipScreenState)")
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let userAction = userActions[indexPath.item]
        cell.cellLabel.text = userAction.rawValue
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
            
        case .showIp:
            print("IP")
            ipScreenState = true
            performSegue(withIdentifier: "toExtrasDetails", sender: nil)
        case .showDog:
            print("DOG")
            ipScreenState = false
            performSegue(withIdentifier: "toExtrasDetails", sender: nil)
        }
    }
    
}

extension ExtrasCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
