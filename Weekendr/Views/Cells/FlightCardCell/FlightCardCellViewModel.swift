//
//  FlightCardCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

class FlightCardCellViewModel: NSObject {
    
    // MARK: - Properties
    var flight: Flight
    
    init(flight: Flight) {
        self.flight = flight
    }
}

// MARK: - Methods
extension FlightCardCellViewModel {
    
    func cityDestination() -> String {
        return flight.destiName
    }
    func countryDestination() -> String {
        return flight.country.uppercased()
    }
    func imageUrl() -> String {
        return flight.dImage
    }
    func title() -> String {
        return "\(flight.days)j | \(flight.goInfoDeskt) - \(flight.returnInfoDeskt)"
    }
    func price() -> String {
        return "\(flight.wePrice)€"
    }
}
