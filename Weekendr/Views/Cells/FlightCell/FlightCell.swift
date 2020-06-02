//
//  FlightCell.swift
//  Weekendr
//
//  Created by Reqven on 31/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {
    
    // MARK: - Properties
    var viewModel: FlightCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    func setupViews() {
        selectionStyle = .none
    }
}

// MARK: - Setup
extension FlightCell {

    func setup(with viewModel: FlightCellViewModel) {
        self.viewModel = viewModel
        
        textLabel?.text = viewModel.cityDestination()
        detailTextLabel?.text = viewModel.countryDestination()
        
        setNeedsLayout()
    }
}
