//
//  Describable.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import Foundation

protocol Describable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension Describable {
    var typeName: String {
        return String(describing: self)
    }

    static var typeName: String {
        return String(describing: self)
    }
}

extension Describable where Self: NSObjectProtocol {
    var typeName: String {
        return String(describing: type(of: self))
    }
}
