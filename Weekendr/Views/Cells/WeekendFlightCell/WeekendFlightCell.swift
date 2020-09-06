//
//  WeekendFlightCell.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class WeekendFlightCell: UITableViewCell {
    
    // MARK: - Properties
    var viewModel: WeekendFlightCellViewModel?
    
    let titleLabel = UILabel()
    let refundLabel = UILabel()
    
    let flightView = UIStackView()
    let goFlight = FlightView()
    let returnFlight = FlightView()
    
    let moreFlightsButton = UIButton(type: .system)
    let bookButton = MultipleLabelsRoundedButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
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
        // backgroundColor = .secondarySystemGroupedBackground
        backgroundColor = UIColor.init(named: "background")
        contentView.addSubviews(titleLabel, flightView, moreFlightsButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        refundLabel.translatesAutoresizingMaskIntoConstraints = false
        flightView.translatesAutoresizingMaskIntoConstraints = false
        moreFlightsButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Mon vol"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        refundLabel.text = "Remboursé si annulé | Prix garanti"
        refundLabel.backgroundColor = .tertiarySystemGroupedBackground
        
        moreFlightsButton.setTitle("Voir plus de vols", for: .normal)
        
        let a = UIStackView(arrangedSubviews: [goFlight, returnFlight])
        a.spacing = 15
        a.axis = .vertical
        a.alignment = .leading
        a.distribution = .fillProportionally

        
        bookButton.backgroundColor = .systemBlue
        bookButton.secondaryLabel.text = "Réserver"
        bookButton.secondaryLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        bookButton.primaryLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            
        flightView.alignment = .center
        flightView.distribution = .equalSpacing
        flightView.addArrangedSubviews(a, bookButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            flightView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            flightView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            flightView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            moreFlightsButton.topAnchor.constraint(equalTo: flightView.bottomAnchor, constant: 8),
            moreFlightsButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            moreFlightsButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            moreFlightsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    @objc func didTapMoreFlights() {
        viewModel?.delegate?.didTapMoreFlights()
    }
    @objc func didTapBookFlight() {
        viewModel?.delegate?.didTapBookFlight()
    }
}

// MARK: - Setup
extension WeekendFlightCell {

    func setup(with viewModel: WeekendFlightCellViewModel) {
        self.viewModel = viewModel
        
        goFlight.dayLabel.text  = viewModel.go.day
        goFlight.dateLabel.text = viewModel.go.date
        goFlight.fromLabel.text = viewModel.goFrom
        goFlight.toLabel.text   = viewModel.goTo
        
        returnFlight.dayLabel.text  = viewModel.back.day
        returnFlight.dateLabel.text = viewModel.back.date
        returnFlight.fromLabel.text = viewModel.backFrom
        returnFlight.toLabel.text   = viewModel.backTo
        
        let range = NSString(string: viewModel.price).range(of: "/p")
        let attributedText = NSMutableAttributedString.init(string: viewModel.price)
        attributedText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], range: range)
        
        bookButton.primaryLabel.text = viewModel.price
        bookButton.primaryLabel.attributedText = attributedText
        bookButton.addTarget(self, action: #selector(didTapBookFlight), for: .touchUpInside)
        moreFlightsButton.addTarget(self, action: #selector(didTapMoreFlights), for: .touchUpInside)
        
        setNeedsLayout()
    }
}
