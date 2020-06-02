//
//  UIStackView+Ext.swift
//  Weekendr
//
//  Created by Reqven on 28/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
