//
//  FlightCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 31/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

class FlightCellViewModel: NSObject {
    
    // MARK: - Properties
    var flight: Flight
    
    init(flight: Flight) {
        self.flight = flight
    }
    
    func cityDestination() -> String {
        return flight.destiName
    }
    func countryDestination() -> String {
        return flight.country
    }
}

