//
//  Weekend.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation


// MARK: - Weekend
struct Weekend: Codable {
    let userID: String?
    let authorization: Bool
    let idMetier: String
    let backgroundURL: String
    let nbDays: Int
    let nbNights: Int
    let weFormat: Int
    let meteo: Int
    let cityFrom: String
    let cityTo: String
    let tags: Tags
    let welcomeDescription: Description
    let vehicle: TransportType
    let chart: Chart
    let transport: Transport
    let hotel: Hotel
}

// MARK: - Chart
struct Chart: Codable {
    let weekNumber: Int
    let graph: [Graph]
    let button: Button
    let otherWeeknds: [String: [OtherWeeknd]]
}

// MARK: - Button
struct Button: Codable {
    let goInfo: String
    let returnInfo: String
    let wePrice: Int
    let fPrice: Int
    let hPrice: Int
}

// MARK: - Graph
struct Graph: Codable {
    let weDate: String
    let weekNumber: Int
    let wePrice: Int
    let fPrice: Int
    let hPrice: Int
    let idMetier: String
}

// MARK: - OtherWeeknd
struct OtherWeeknd: Codable {
    let weFormat: Int
    let idMetier: String
    let days: Int
    let wePrice: Int
    let hPrice: Int
    let fPrice: Int
    let goInfo: String
    let returnInfo: String
}

// MARK: - Hotel
struct Hotel: Codable {
    let name, address: String
    let stars: Int
    let photo: [String]
    let roomAvailable: Int
    let reviewScoreUnity: String
    let reviewScoreDEC: String
    let numberOfReviews: Int
    let price: Int
    let bookingLink: String
    let bookingOtherLink: String
    let airbnbOtherLink: String
    let updatedAt: String
}

// MARK: - Tags
struct Tags: Codable {
    let marks: Marks
    let labels: Labels
    let title: String
}

// MARK: - Labels
struct Labels: Codable {
    let temp:String
    let pinte: String
    let days: String
    let passenger: String
    let banana: String
    let weekendLabel: String
}

// MARK: - Marks
struct Marks: Codable {
    let transport: Double
    let hotel: Double
    let attractivity: Double
    let weekend: Double
}

// MARK: - Transport
struct Transport: Codable {
    let go: Go
    let transportReturn: Go
    let price: Int
    let kiwiLink: String
    let kiwiOtherLink: String
    let updatedAt: String
}

// MARK: - Go
struct Go: Codable {
    let day: String
    let date: String
    let hourFrom: String
    let hourTo: String
    let placeFrom: String
    let placeTo: String
    let company: String
    let companyName: String
    let summary: String
}

// MARK: - Description
struct Description: Codable {
    let labels: [String]
    let country: String
    let city: String
    let flag: String
    let descriptionDescription: String
    let kiwiPhoto: String
}
