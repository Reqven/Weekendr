//
//  WeekendFlightCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

protocol WeekendFlightDelegate: class {
    func didTapMoreFlights()
    func didTapBookFlight()
}

class WeekendFlightCellViewModel: NSObject {
    
    // MARK: - Properties
    weak var delegate: WeekendFlightDelegate?
    var weekend: Weekend
    
    var go: Go { weekend.transport.go }
    var goFrom: String { "\(go.hourFrom) - \(go.placeFrom)" }
    var goTo: String { "\(go.hourTo) - \(go.placeTo)" }
    
    var back: Go { weekend.transport.transportReturn }
    var backFrom: String { "\(back.hourFrom) - \(back.placeFrom)" }
    var backTo: String { "\(back.hourTo) - \(back.placeTo)" }
    
    var price: String { "\(weekend.transport.price)€/p" }
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}
