//
//  NetworkManager.swift
//  HW2.10
//
//  Created by Maxon on 23.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func getCurrencyList(from urlString: String, with complition: @escaping (CbrExchangeRates) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            
            do {
                let valutesList = try jsonDecoder.decode(CbrExchangeRates.self, from: data)
                
                DispatchQueue.main.async {
                    complition(valutesList)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getCurrencyList2(from urlString: String, with complition: @escaping (CbrExchangeRates) -> Void) {
        
        var valutesList: [String : Valute] = [:]
        var valutesList2: CbrExchangeRates!
        
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let valutesData = value as? [String : Any] else { return }
                    for valuteData in valutesData {
                        if valuteData.key == "Valute" {
                            if let newValute = valutesData["Valute"] as? [String : Any] {
                                for new in newValute {
                                    if let newNew = new.value as? [String : Any] {
                                        valutesList[new.key] = Valute(
                                            Nominal: newNew["Nominal"] as? Int,
                                            Name: newNew["Name"] as? String,
                                            Value: newNew["Value"] as? Double,
                                            Previous: newNew["Previous"] as? Double)
                                    }
                                }
                            }
                        }
                        valutesList2 = CbrExchangeRates(Valute: valutesList)
                    }
                    DispatchQueue.main.async {
                        complition(valutesList2)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getIpAddress(from urlString: String, with complition: @escaping (ShowIP) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let ipValue = try jsonDecoder.decode(ShowIP.self, from: data)
                DispatchQueue.main.async {
                    complition(ipValue)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getRandomDogPicture(from urlString: String, with complition: @escaping (RandomDog) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let dogImage = try jsonDecoder.decode(RandomDog.self, from: data)
                DispatchQueue.main.async {
                    complition(dogImage)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getImage(from urlString: String, with complition: @escaping (UIImage) -> Void) {
        let format = "g"
        let falseImage: UIImage = .remove
        
        guard let imageURL = URL(string: urlString) else { return }
        
        if String(imageURL.lastPathComponent.last!) == format.lowercased() || String(imageURL.lastPathComponent.last!) == format.uppercased() {
            URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        complition(image)
                    }
                }
            }.resume()
        } else {
            DispatchQueue.main.async {
                complition(falseImage)
            }
        }
    }
}
