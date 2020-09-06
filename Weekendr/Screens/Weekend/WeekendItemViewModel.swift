//
//  WeekendItemViewModel.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

enum WeekendItemViewModelType {
    case summary
    case format
    case flight
    case hotel
}

protocol WeekendItemViewModel {
    var type: WeekendItemViewModelType { get }
    // var sectionTitle: String { get }
    // var rowCount: Int { get }
}

/*extension WeekendItemViewModel {
    var rowCount: Int { return 1 }
}*/


class WeekendSummaryItemViewModel: WeekendItemViewModel {

    var type: WeekendItemViewModelType { return .summary }
    var weekend: Weekend
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}

class WeekendFormatItemViewModel: WeekendItemViewModel {

    var type: WeekendItemViewModelType { return .format }
    var weekend: Weekend
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}

class WeekendFlightItemViewModel: WeekendItemViewModel {

    var type: WeekendItemViewModelType { return .flight }
    var weekend: Weekend
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}

class WeekendHotelItemViewModel: WeekendItemViewModel {

    var type: WeekendItemViewModelType { return .hotel }
    var weekend: Weekend
    
    init(weekend: Weekend) {
        self.weekend = weekend
    }
}
