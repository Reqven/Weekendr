//
//  WeekendViewModel.swift
//  Weekendr
//
//  Created by Reqven on 04/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

protocol WeekendDelegate: class {
    func didLoadWeekend()
    func didFailLoading()
    func didTapHotelMap()
    func didTapBookHotel()
    func didTapMoreFlights()
    func didTapBookFlight()
}

class WeekendViewModel: NSObject {

    // MARK: - Properties
    weak var delegate: WeekendDelegate?
    
    var flight: Flight
    var weekend: Weekend?
    var items = [WeekendItemViewModel]()
    
    init(flight: Flight) {
        self.flight = flight
        super.init()
        
        NetworkManager.shared.getWeekend(flight: flight, completed: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let weekend):
                self.weekend = weekend
                self.items.append(WeekendSummaryItemViewModel(weekend: weekend))
                self.items.append(WeekendFlightItemViewModel(weekend: weekend))
                self.items.append(WeekendHotelItemViewModel(weekend: weekend))
                self.items.append(WeekendFormatItemViewModel(weekend: weekend))
                
                DispatchQueue.main.async {
                    self.delegate?.didLoadWeekend()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.delegate?.didFailLoading()
                }
            }
        })
    }
}


// MARK: - UITableView DataSource
extension WeekendViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
            case .summary:
                if let cell = tableView.dequeueReusableCell(withIdentifier: WeekendCell.typeName, for: indexPath) as? WeekendCell,
                   let item = item as? WeekendSummaryItemViewModel {
                    let viewModel = WeekendCellViewModel(weekend: item.weekend)
                        cell.setup(with: viewModel)
                        return cell
                }
            case .flight:
                if let cell = tableView.dequeueReusableCell(withIdentifier: WeekendFlightCell.typeName, for: indexPath) as? WeekendFlightCell,
                   let item = item as? WeekendFlightItemViewModel {
                    let viewModel = WeekendFlightCellViewModel(weekend: item.weekend)
                    viewModel.delegate = self
                        cell.setup(with: viewModel)
                        return cell
                }
            case .hotel:
                if let cell = tableView.dequeueReusableCell(withIdentifier: WeekendHotelCell.typeName, for: indexPath) as? WeekendHotelCell,
                   let item = item as? WeekendHotelItemViewModel {
                    let viewModel = WeekendHotelCellViewModel(weekend: item.weekend)
                    viewModel.delegate = self
                        cell.setup(with: viewModel)
                        return cell
                }
            default:
                let cell = UITableViewCell()
                cell.textLabel?.text = "Item not handled yet"
                cell.backgroundColor = UIColor.init(named: "background")!
                return cell
        }
        return UITableViewCell()
    }
}


// MARK: - UITableView Delegate
extension WeekendViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard tableView.numberOfSections - 1 != section else { return 0 }
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}


// MARK: - WeekendFlight Delegate
extension WeekendViewModel: WeekendFlightDelegate, WeekendHotelDelegate {
    
    func didTapMoreFlights() {
        delegate?.didTapMoreFlights()
    }
    
    func didTapBookHotel() {
        delegate?.didTapBookHotel()
    }
    
    func didTapHotelMap() {
        delegate?.didTapHotelMap()
    }
    
    func didTapBookFlight() {
        delegate?.didTapBookFlight()
    }
}

