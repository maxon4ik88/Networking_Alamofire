//
//  CbrExchangeRates.swift
//  HW2.10
//
//  Created by Maxon on 21.09.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//


struct Valute: Decodable {
    var Nominal: Int?
    var Name: String?
    var Value: Double?
    var Previous: Double?
}

struct CbrExchangeRates: Decodable {
    var Valute: [String : Valute]?
}

struct ShowIP: Decodable {
    let ip: String
}

struct RandomDog: Decodable {
    let url: String
}
