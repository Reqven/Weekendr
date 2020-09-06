//
//  WeekendCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

class WeekendCellViewModel: NSObject {
    
    // MARK: - Properties
    var weekend: Weekend
    
    var totalPrice: Int { weekend.hotel.price + weekend.transport.price }
    var transportPrice: Int { weekend.transport.price }
    var hotelPrice: Int { weekend.hotel.price }
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}
