//
//  DetailsExtrasViewController.swift
//  HW2.10
//
//  Created by Maxon on 23.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class DetailsExtrasViewController: UIViewController {
    
    @IBOutlet var ipLabel: UILabel!
    @IBOutlet var dogScreenImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var ipValue: ShowIP!
    var dogImage: RandomDog!
    var dogImageUrl: URL!
    
    var ipScreen: Bool!
    var dogScreen: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        ipLabel.isHidden = true
        dogScreenImageView.isHidden = true
        
        if ipScreen != nil && ipScreen == true {
            ipLabel.isHidden = false
            NetworkManager.shared.getIpAddress(from: UrlLinks.showIP.rawValue) { (ShowIP) in
                self.activityIndicator.stopAnimating()
                self.ipValue = ShowIP
                self.ipLabel.text = "Ваш IP - " + self.ipValue.ip
            }
        } else if ipScreen != nil && ipScreen == false {
            ipLabel.isHidden = true
        }
        
        if dogScreen != nil && dogScreen == true {
            dogScreenImageView.isHidden = false
            NetworkManager.shared.getRandomDogPicture(from: UrlLinks.randomDog.rawValue) { (RandomDog) in
                self.activityIndicator.stopAnimating()
                self.dogImage = RandomDog
                self.dogImageUrl = URL(string: self.dogImage.url)
                NetworkManager.shared.getImage(from: self.dogImageUrl.absoluteString) { (UIImage) in
                    self.activityIndicator.stopAnimating()
                    self.dogScreenImageView.image = UIImage
                }
            }
        } else if dogScreen != nil && dogScreen == false {
            dogScreenImageView.isHidden = true
        }
    }

}
