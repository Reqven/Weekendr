//
//  FlightView.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class FlightView: UIStackView {
    
    let dateStackView = UIStackView()
    let dayLabel = UILabel()
    let dateLabel = UILabel()
    
    let timeStackView = UIStackView()
    let fromLabel = UILabel()
    let toLabel = UILabel()
    let separatorImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        dateStackView.spacing = 5
        dateStackView.alignment = .firstBaseline
        dateStackView.distribution = .equalSpacing
        dateStackView.addArrangedSubviews(dayLabel, dateLabel)
        
        dayLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        dayLabel.textColor = UIColor.init(named: "dev")!
        dateLabel.textColor = UIColor.init(named: "dev")!
        
        
        timeStackView.spacing = 5
        timeStackView.alignment = .center
        timeStackView.distribution = .equalSpacing
        timeStackView.addArrangedSubviews(fromLabel, separatorImageView, toLabel)
        
        fromLabel.textColor = UIColor.init(named: "dev")!
        toLabel.textColor = UIColor.init(named: "dev")!
        fromLabel.font = UIFont.systemFont(ofSize: 12)
        toLabel.font = UIFont.systemFont(ofSize: 12)
        
        separatorImageView.image = UIImage(systemName: "arrow.right")
        
        
        axis = .vertical
        alignment = .leading
        addArrangedSubviews(dateStackView, timeStackView)
    }
}
