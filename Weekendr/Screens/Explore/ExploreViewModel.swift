//
//  ExploreViewModel.swift
//  Weekendr
//
//  Created by Reqven on 31/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

protocol ExploreViewModelEventsDelegate: class {
    func didSelectFlight(flight: Flight)
    func flightsDidLoad()
    func loadingDidFail()
}

class ExploreViewModel: NSObject {

    // MARK: - Properties
    weak var delegate: ExploreViewModelEventsDelegate?
    var items = [ExploreItemViewModel]()
    
    override init() {
        super.init()
        
        let today = Date()
        let nextWeekend = Helper.nextWeekend() ?? today
        
        NetworkManager.shared.getFlights(from: nextWeekend, to: nextWeekend, completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let flights):
                self.items.append(ExploreFlightListItemViewModel(flights: flights))
                self.items.append(ExploreFlightItemViewModel(flights: flights))
                DispatchQueue.main.async {
                    self.delegate?.flightsDidLoad()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.delegate?.loadingDidFail()
                }
            }
        })
    }
}


// MARK: - UITableView DataSource
extension ExploreViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
            case .flight:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.typeName, for: indexPath) as? FlightCell,
                   let item = item as? ExploreFlightItemViewModel {
                        let flight = item.flight(for: indexPath)
                        let viewModel = FlightCellViewModel(flight: flight)
                        cell.setup(with: viewModel)
                        return cell
                }
            case .flightList:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FlightListCell.typeName, for: indexPath) as? FlightListCell,
                   let item = item as? ExploreFlightListItemViewModel {
                        let viewModel = FlightListCellViewModel(flights: item.flights)
                        viewModel.delegate = self
                        cell.setup(with: viewModel)
                        return cell
                }
        }
        return UITableViewCell()
    }
}


// MARK: - ViewModel Events Delegate
extension ExploreViewModel: FlightListCellViewModelEventsDelegate {
    
    func didSelectFlight(flight: Flight) {
        delegate?.didSelectFlight(flight: flight)
    }
}
