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
    let userId: String?
    let authorization: Bool
    let idMetier: String
    let hIdMetier: String
    let backgroundUrl: String
    let nbDays: Int
    let nbNights: Int
    let weFormat: Int
    let meteo: Int
    let cityFrom: String
    let cityTo: String
    let tags: Tags
    let weekendDescription: Description?
    let vehicle: Int
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
    let hotelBookingId: Int
    let name, address: String
    let stars: Int
    let photo: [String]
    let roomAvailable: Int
    let reviewScoreUnity: String
    let reviewScoreDec: String
    let numberOfReviews: Int
    let price: Int
    let distanceCenter: String
    let bookingLink: String
    let bookingOtherLink: String
    let updatedAt: String
    let scores: Scores
    let reviews: [Review]
    let hotelPlus: [HotelPlus]
    let location: HotelLocation
    let aoiPolygon: AoiPolygon?
    let aoiPolygonId: Int
    let insideAoiPolygon: Bool
    let aoiPolygons: [String: AoiPolygon]
    let landmarks: [Landmark]
    let otherHotels: [OtherHotel]
    let params: HotelParams
    let bookingLinkStatic: String
    let bookingLinkDynamic: String
}

// MARK: - AoiPolygon
struct AoiPolygon: Codable {
    let type: String
    let geometry: Geometry
    let properties: Properties
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [[[Double]]]
}

// MARK: - Properties
struct Properties: Codable {
    let bbox: [Double]
    let name: String
    let nbBar: Int
    let nbShop: Int
    let areaKm2: Double
    let centroid: String
    let percBar: Int
    let districts: [String]
    let percShop: Int
    let scoreBar: Int
    let totalPoi: Int
    let scoreShop: Int
    let nbNightclub: Int
    let nbRestaurant: Int
    let subcategories: Subcategories
    let clusterNumber: Int
    let percNightclub: Int
    let percRestaurant: Int
    let scoreRestaurant: Int
}

// MARK: - Subcategories
struct Subcategories: Codable {
    let barSubcategories, shopSubcategories, restaurantSubcategories: [String]
}

// MARK: - HotelPlus
struct HotelPlus: Codable {
    let icon: String
    let nameWeekendr: String
    let rank: Int?
}

// MARK: - Landmark
struct Landmark: Codable {
    let name: String
    let location: LandmarkLocation
}

// MARK: - LandmarkLocation
struct LandmarkLocation: Codable {
    let lat: Double
    let lng: Double
}

// MARK: - HotelLocation
struct HotelLocation: Codable {
    let latitude: Double
    let longitude: Double
}

// MARK: - OtherHotel
struct OtherHotel: Codable {
    let price: Int
    let hotelBookingId: Int
    let location: HotelLocation
    let aoiPolygonId: Int
}

// MARK: - HotelParams
struct HotelParams: Codable {
    let arrivalWhen: String
    let returnWhen: String
}

// MARK: - Review
struct Review: Codable {
    let value: String
    let reviewerName: String
    let country: String
}

// MARK: - Scores
struct Scores: Codable {
    let qualityPrice: Clean
    let location: Clean
    let clean: Clean
    let comfort: Clean
    let staff: Clean
}

// MARK: - Clean
struct Clean: Codable {
    let value: Double
    let label: String
}

// MARK: - Tags
struct Tags: Codable {
    let marks: Marks
    let labels: Labels
    let title: String
}

// MARK: - Labels
struct Labels: Codable {
    let temp, pinte, days, passenger: String
    let banana, weekendLabel: String
}

// MARK: - Marks
struct Marks: Codable {
    let transport: Double
    let hotel: Double?
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
    let params: TransportParams
    
    enum CodingKeys: String, CodingKey {
        case go
        case transportReturn = "return"
        case price
        case kiwiLink
        case kiwiOtherLink
        case updatedAt
        case params
    }
}

// MARK: - Go
struct Go: Codable {
    let day, date, hourFrom, hourTo: String
    let placeFrom, placeTo: String
    let company: String
    let companyName, summary: String
}

// MARK: - TransportParams
struct TransportParams: Codable {
    let flyFrom, flyTo, dateFrom, dateTo: String
    let returnFrom, returnTo, dtimeFrom, dtimeTo: String
    let retDtimeFrom, retDtimeTo, vehicleType, kiwiId: String
    let mobile: String?
    let arrivalWhen, returnWhen: String
    let price: Int
    let userId: String?
    let passengers: String
    let offset: Int
}

// MARK: - Description
struct Description: Codable {
    let labels: [String]
    let country, bookingCountry, city, descriptionDescription: String
    let kiwiPhoto: String
}








/* MARK: - Weekend
struct Weekend: Codable {
    let userId: String?
    let authorization: Bool
    let idMetier: String
    let backgroundUrl: String
    let nbDays: Int
    let nbNights: Int
    let weFormat: Int
    let meteo: Int
    let cityFrom: String
    let cityTo: String
    let tags: Tags
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
    let hotel: Double?
    let attractivity: Double
    let weekend: Double
}

// MARK: - Transport
struct Transport: Codable {
    let go: Go
    let transportReturn: Go?
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
}*/
