//
//  WeekendCell.swift
//  Weekendr
//
//  Created by Reqven on 05/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class WeekendCell: UITableViewCell {
    
    // MARK: - Properties
    var viewModel: WeekendCellViewModel?
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let totalPriceStackView = PriceStackView()
    let transportPriceStackView = PriceStackView()
    let hotelPriceStackView = PriceStackView()
    
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
        contentView.addSubviews(titleLabel, subtitleLabel)
        //, totalPriceStackView, transportPriceStackView, hotelPriceStackView, descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        transportPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        hotelPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        subtitleLabel.textAlignment = .center
        
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        // subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        // subtitleLabel.textColor = UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.00)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        
        titleLabel.text = "Le plan de Weekendr"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
            
            /*totalPriceStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            totalPriceStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            totalPriceStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            transportPriceStackView.topAnchor.constraint(equalTo: totalPriceStackView.bottomAnchor, constant: 5),
            transportPriceStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            transportPriceStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            hotelPriceStackView.topAnchor.constraint(equalTo: transportPriceStackView.bottomAnchor, constant: 5),
            hotelPriceStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            hotelPriceStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: hotelPriceStackView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)*/
        ])
    }
}

// MARK: - Setup
extension WeekendCell {

    func setup(with viewModel: WeekendCellViewModel) {
        self.viewModel = viewModel
        
        totalPriceStackView.label.text = "Prix total"
        totalPriceStackView.price.text = "\(String(viewModel.totalPrice))€"
        totalPriceStackView.price.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1.00)
        
        transportPriceStackView.label.text = "Mon vol"
        transportPriceStackView.price.text = "\(String(viewModel.transportPrice))€"
        transportPriceStackView.price.textColor = UIColor(red: 0.00, green: 0.80, blue: 0.71, alpha: 1.00)
        
        hotelPriceStackView.label.text = "Prix hôtel"
        hotelPriceStackView.price.text = "\(String(viewModel.hotelPrice))€"
        hotelPriceStackView.price.textColor = UIColor(red: 0.29, green: 0.62, blue: 0.87, alpha: 1.00)
        
        subtitleLabel.text = "\(viewModel.weekend.nbDays) jours - \(viewModel.weekend.nbNights) nuits"
        descriptionLabel.text = viewModel.weekend.hotel.reviews[0].value
        
        setNeedsLayout()
    }
}


class PriceStackView: UIStackView {
    
    let imageView = UIImageView()
    let label = UILabel()
    let price = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    init(image: UIImage, label: String, price: Int) {
        super.init(frame: .zero)
        
        self.imageView.image = image
        self.label.text = label
        self.price.text = String(price)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.00)
        let container = UIStackView(arrangedSubviews: [imageView, label])
        container.alignment = .center
        container.spacing = 10
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        
        price.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        addArrangedSubviews(container, price)
    }
}
