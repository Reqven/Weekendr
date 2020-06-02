//
//  FlightListCellViewModel.swift
//  Weekendr
//
//  Created by Reqven on 01/06/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class FlightListCellViewModel: NSObject {
    
    // MARK: - Properties
    var flights: [Flight]
    
    init(flights: [Flight]) {
        self.flights = flights
    }
}

// MARK: - Methods
extension FlightListCellViewModel {
    
    func flight(for indexPath: IndexPath) -> Flight {
        return flights[indexPath.row]
    }
}

// MARK: - UICollectionView DataSource
extension FlightListCellViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightCardCell.typeName, for: indexPath) as? FlightCardCell {
            let viewModel = FlightCardCellViewModel(flight: flight(for: indexPath))
            cell.setup(with: viewModel)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate
extension FlightListCellViewModel: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView DelegateFlowLayout
extension FlightListCellViewModel: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        let referenceHeight: CGFloat = 200 // Approximate height
        let referenceWidth = collectionView.frame.width
            - sectionInset.left
            - sectionInset.right
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
}
