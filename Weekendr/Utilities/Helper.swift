//
//  Helper.swift
//  Weekendr
//
//  Created by DevAndDeploy on 02/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

enum Helper {
    
    static func nextWeekend() -> Date? {
        let today = Date()
        let calendar = Calendar(identifier: .gregorian)
        
        if let weekend = calendar.nextWeekend(startingAfter: today) {
            return weekend.start
        }
        return nil
    }
}
