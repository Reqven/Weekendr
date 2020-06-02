//
//  ExploreItemViewModel.swift
//  Weekendr
//
//  Created by Reqven on 31/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

enum ExploreItemViewModelType {
    case flight
    case flightList
}

protocol ExploreItemViewModel {
    var type: ExploreItemViewModelType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

extension ExploreItemViewModel {
    var rowCount: Int { return 1 }
}


class ExploreFlightItemViewModel: ExploreItemViewModel {

    var type: ExploreItemViewModelType { return .flight }
    var sectionTitle: String { return "Flights" }
    var rowCount: Int { return flights.count }

    var flights: [Flight]
    
    init(flights: [Flight]) {
        self.flights = flights
    }
}

extension ExploreFlightItemViewModel {
    
    func flight(for indexPath: IndexPath) -> Flight {
        return flights[indexPath.row]
    }
}

class ExploreFlightListItemViewModel: ExploreItemViewModel {

    var type: ExploreItemViewModelType { return .flightList }
    var sectionTitle: String { return "Flights" }

    var flights: [Flight]
    
    init(flights: [Flight]) {
        self.flights = flights
    }
}

extension ExploreFlightListItemViewModel {
    
    func flight(for indexPath: IndexPath) -> Flight {
        return flights[indexPath.row]
    }
}

