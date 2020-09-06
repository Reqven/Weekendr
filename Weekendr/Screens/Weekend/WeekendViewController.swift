//
//  WeekendViewController.swift
//  Weekendr
//
//  Created by Reqven on 04/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class WeekendViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: WeekendViewModel!
    var tableView: UITableView!
    
    var headerView = UIView()
    var backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.label]
        
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.barStyle = .default
    }
    
    init(flight: Flight) {
        super.init(nibName: nil, bundle: nil)
        viewModel = WeekendViewModel(flight: flight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Setup
extension WeekendViewController {
    
    private func initialSetup() {
        view.backgroundColor = .systemGroupedBackground
        viewModel.delegate = self
        
        setupNavigationBar()
        setupHeader()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        title = viewModel.flight.destiName
    }
    
    private func setupHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        NetworkManager.shared.downloadImage(from: self.viewModel.flight.dImage) { [weak self] image in
            DispatchQueue.main.async {
                self?.backgroundImageView.image = image
            }
        }
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        headerView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(overlay)
        view.addSubview(headerView)
        
        backgroundImageView.pinToEdges(of: headerView)
        overlay.pinToEdges(of: backgroundImageView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator  = false
        tableView.rowHeight                     = UITableView.automaticDimension
        tableView.estimatedRowHeight            = 400
        tableView.backgroundColor               = .clear
        tableView.tableFooterView               = UIView()
        tableView.separatorStyle = .none
        //tableView.delaysContentTouches = false
        //tableView.canCancelContentTouches = true
        
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(WeekendCell.self, forCellReuseIdentifier: WeekendCell.typeName)
        tableView.register(WeekendFlightCell.self, forCellReuseIdentifier: WeekendFlightCell.typeName)
        tableView.register(WeekendHotelCell.self, forCellReuseIdentifier: WeekendHotelCell.typeName)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


// MARK: - Weekend Delegate
extension WeekendViewController: WeekendDelegate {

    func didLoadWeekend() {
        tableView.reloadData()
    }
    
    func didFailLoading() {
        let message = "An error occured while retrieving the data. Please retry later"
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func didTapHotelMap() {
        notImplemented(function: "didTapHotelMap")
    }
    
    func didTapBookHotel() {
        notImplemented(function: "didTapBookHotel")
    }
    
    func didTapMoreFlights() {
        notImplemented(function: "didTapMoreFlights")
    }
    
    func didTapBookFlight() {
        notImplemented(function: "didTapBookFlight")
    }
    
    
    private func notImplemented(function: String?) {
        let message = "Not implemented yet"
        let alert = UIAlertController(title: function ?? "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
