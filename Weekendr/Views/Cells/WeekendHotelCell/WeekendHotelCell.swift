//
//  WeekendHotelCell.swift
//  Weekendr
//
//  Created by Reqven on 06/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit
import MapKit

class WeekendHotelCell: UITableViewCell {
    
    // MARK: - Properties
    var viewModel: WeekendHotelCellViewModel?
    
    let titleLabel = UILabel()
    
    let hotelView = UIStackView()
    let hotelLabel = UILabel()
    let hotelAddress = UILabel()
    let bookButton = MultipleLabelsRoundedButton()
    
    let mapView = MKMapView()
    let hotelAnnotation = MKPointAnnotation()
    
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
        backgroundColor = UIColor.init(named: "background")
        contentView.addSubviews(titleLabel, hotelView, mapView, bookButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        hotelView.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Mon hôtel"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        
        hotelLabel.text = "Hotel"
        hotelLabel.font = UIFont.systemFont(ofSize: 18)
        
        hotelAddress.text = "Address"
        hotelAddress.font = UIFont.systemFont(ofSize: 13)
        
    
        
        let a = UIStackView(arrangedSubviews: [hotelLabel, hotelAddress])
        a.spacing = 3
        a.axis = .vertical
        a.alignment = .leading
        
        let ratingView = UIView()
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ratingLabel.text = "8.5"
        ratingLabel.textColor = .white
        ratingView.backgroundColor = .systemBlue
        
        ratingView.layer.cornerRadius = 8
        ratingView.layer.maskedCorners = CACornerMask([.layerMaxXMaxYCorner, .layerMinXMinYCorner])
        
        ratingView.addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingView.layoutMarginsGuide.topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingView.layoutMarginsGuide.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: ratingView.layoutMarginsGuide.trailingAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: ratingView.layoutMarginsGuide.bottomAnchor),
        ])
        
        bookButton.secondaryLabel.text = "Réserver"
        bookButton.backgroundColor = .systemBlue
        bookButton.primaryLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        bookButton.secondaryLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        
        hotelView.alignment = .center
        hotelView.distribution = .equalSpacing
        hotelView.addArrangedSubviews(a, ratingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            hotelView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: contentView.layoutMargins.top),
            hotelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            hotelView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            mapView.topAnchor.constraint(equalTo: hotelView.bottomAnchor, constant: contentView.layoutMargins.top),
            mapView.heightAnchor.constraint(equalToConstant: 150),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            bookButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            bookButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: contentView.layoutMargins.top),
            bookButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            bookButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            bookButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.layoutMargins.top),
        ])
    }
    
    @objc func didTapHotelMap() {
        viewModel?.delegate?.didTapHotelMap()
    }
    @objc func didTapBookHotel() {
        viewModel?.delegate?.didTapBookHotel()
    }
}

// MARK: - Setup
extension WeekendHotelCell {

    func setup(with viewModel: WeekendHotelCellViewModel) {
        self.viewModel = viewModel
        
        hotelLabel.text = viewModel.weekend.hotel.name
        hotelAddress.text = viewModel.weekend.hotel.address
        
        bookButton.primaryLabel.text = viewModel.price
        bookButton.addTarget(self, action: #selector(didTapBookHotel), for: .touchUpInside)
        
        let latitude = viewModel.weekend.hotel.location.latitude
        let longitude = viewModel.weekend.hotel.location.longitude
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        hotelAnnotation.coordinate = location.coordinate
        mapView.addAnnotation(hotelAnnotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        setNeedsLayout()
    }
}
