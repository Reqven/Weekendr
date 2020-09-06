//
//  WeekendHotelCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 06/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

protocol WeekendHotelDelegate: class {
    func didTapHotelMap()
    func didTapBookHotel()
}

class WeekendHotelCellViewModel: NSObject {
    
    // MARK: - Properties
    weak var delegate: WeekendHotelDelegate?
    var weekend: Weekend
    
    var price: String { "\(weekend.hotel.price)€ par personne" }
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}
