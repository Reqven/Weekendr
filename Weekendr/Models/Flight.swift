//
//  Flight.swift
//  Weekendr
//
//  Created by Reqven on 23/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

// MARK: - Weekend
struct Flight: Codable {
    /*let arrivalDay: Int
    let arrivalWhen: Int
    let returnDay: Int
    let returnWhen: Int
    let weDate: String
    let days: Int
    let nights: Int
    let destiName: String
    let labels: [String]
    let dPhoto: String
    let dDescription: String?
    let country: String
    let bookingCountry: String
    let destiId: Int
    let wePrice: Int
    let fPrice: Int
    let tagline: String?
    let eDescription: String?
    let ePhoto: String?
    let eAltPhoto: String
    let dImage: String
    let weEvent: Bool
    let weSpecial: Bool
    let eventLocation: String
    let idFrom: Int
    let idMetier: String
    let meteo: Int
    let soon: Bool
    let weDateFront: String
    let goInfoDeskt: String
    let returnInfoDeskt: String
    let goInfoMobile: String
    let returnInfoMobile: String
    let from: String
    let noteWeekend: Double
    let noteFlight: Double
    let noteSexy: Double
    let noteHotel: Double*/
    
    let arrivalDay: Int
    let arrivalWhen: Int
    let returnDay: Int
    let returnWhen: Int
    let weDate: String
    let days: Int
    let nights: Int
    let destiName: String
    let labels: [String]
    let dPhoto: String
    let dDescription: String?
    let country: String
    let bookingCountry: String
    let destiId: Int
    let wePrice: Int
    let fPrice: Int
    let tagline: String?
    let dImage: String
    let idFrom: Int
    let idMetier: String
    let meteo: Int
    let soon: Bool
    let weDateFront: String
    let goInfoDeskt: String
    let returnInfoDeskt: String
    let goInfoMobile: String
    let returnInfoMobile: String
    let from: String
    let noteWeekend: Double
    let noteFlight: Double
    let noteSexy: Double
    let noteHotel: Double
    let distanceCenter: String
    let timeToDestination: String
    let weekendrScore: Double
    
    let vehicle: TransportType
}

// MARK: - TransportType
enum TransportType: Int, Codable {
    case airplane = 0
    case train = 1
}
