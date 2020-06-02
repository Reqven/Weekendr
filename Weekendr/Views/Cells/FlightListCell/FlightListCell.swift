//
//  FlightListCell.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class FlightListCell: UITableViewCell {

    // MARK: - Properties
    var viewModel: FlightListCellViewModel?
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
        collectionView.register(FlightCardCell.self, forCellWithReuseIdentifier: FlightCardCell.typeName)
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumLineSpacing = 12
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing = 12
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return collectionView
    }()
    
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
        backgroundColor = .clear
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 270)
        ])
    }
}

// MARK: - Setup
extension FlightListCell {

    func setup(with viewModel: FlightListCellViewModel) {
        self.viewModel = viewModel
        
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        collectionView.reloadData()
        
        setNeedsLayout()
    }
}
