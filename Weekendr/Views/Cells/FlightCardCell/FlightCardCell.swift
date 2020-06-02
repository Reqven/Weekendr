//
//  FlightCardCell.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class FlightCardCell: UICollectionViewCell {
    
    // MARK: - Properties
    var viewModel: FlightCardCellViewModel?
    
    let stackView               = UIStackView()
    let imageView               = UIImageView()
    let countryLabel            = UILabel()
    let destinationLabel        = UILabel()
    let weekendLabel            = UILabel()
    let priceLabel              = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        contentView.addSubviews(countryLabel, destinationLabel, imageView, stackView)
        stackView.addArrangedSubviews(weekendLabel, priceLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints             = false
        countryLabel.translatesAutoresizingMaskIntoConstraints          = false
        destinationLabel.translatesAutoresizingMaskIntoConstraints      = false
        imageView.translatesAutoresizingMaskIntoConstraints             = false
        weekendLabel.translatesAutoresizingMaskIntoConstraints          = false
        priceLabel.translatesAutoresizingMaskIntoConstraints            = false
        
        stackView.alignment = .center
        stackView.distribution = .fill
        priceLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        destinationLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        destinationLabel.textColor = .label
        
        
        countryLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        countryLabel.textColor = .link
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        
        weekendLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        weekendLabel.textColor = .label
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        priceLabel.textColor = .link
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            destinationLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor),
            destinationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            destinationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        
        return layoutAttributes
    }
}

// MARK: - Setup
extension FlightCardCell {

    func setup(with viewModel: FlightCardCellViewModel) {
        self.viewModel = viewModel
        
        destinationLabel.text   = viewModel.cityDestination()
        countryLabel.text       = viewModel.countryDestination()
        weekendLabel.text       = viewModel.title()
        priceLabel.text         = viewModel.price()
        
        NetworkManager.shared.downloadImage(from: viewModel.imageUrl()) { [weak self] image in
            guard let self = self else { return }
            guard let image = image else { return }
            DispatchQueue.main.async { self.imageView.image = image }
        }
        setNeedsLayout()
    }
}
