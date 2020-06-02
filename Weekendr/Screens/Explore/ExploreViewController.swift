//
//  ExploreViewController.swift
//  Weekendr
//
//  Created by Reqven on 31/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    var viewModel = ExploreViewModel()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Setup
extension ExploreViewController {
    
    private func initialSetup() {
        view.backgroundColor = .systemBackground
        viewModel.delegate = self
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Explore"
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.showsVerticalScrollIndicator  = false
        tableView.rowHeight                     = UITableView.automaticDimension
        tableView.estimatedRowHeight            = 100
        tableView.separatorStyle                = .none
        tableView.backgroundColor               = .clear
        tableView.tableFooterView               = UIView()
        
        tableView.dataSource = viewModel

        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.typeName)
        tableView.register(FlightListCell.self, forCellReuseIdentifier: FlightListCell.typeName)
        view.addSubview(tableView)
    }
}

// MARK: - ViewModel Events Delegate
extension ExploreViewController: ExploreViewModelEventsDelegate {
    
    func flightsDidLoad() {
        tableView.reloadData()
    }
    
    func loadingDidFail() {
        let message = "An error occured while retrieving the data. Please retry later"
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
