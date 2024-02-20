//
//  ViewController.swift
//  lesson24project
//
//  Created by Карина Дьячина on 15.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constants {
        static let eventViewXPosition = 20
        static let title = "TODO"
        //  static let tableViewCell = "EventTableViewCell"
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var eventView = EventView(frame: CGRect(x: Constants.eventViewXPosition, y: 100, width: 350, height: 350))
    
    let events = [Event(title: "Title", description: "Description", date: "2024/02/20")]
    var timeZonesArray: Array<Timezone> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.title
        
        setupNavigation()
        setupTableView()
        
    }
    
    func setupNavigation() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
    }
    
    func getTimeZone(){
        let knownTimeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
        for timeZones in TimeZone.knownTimeZoneIdentifiers {
            let timeZone = TimeZone(identifier: timeZones)
            if let abbreviation = timeZone?.abbreviation(), let seconds = timeZone?.secondsFromGMT() {
                print ("timeZone: \(timeZones) \nabbreviation: \(abbreviation)\nsecondsFromGMT: \(seconds)\n")
                timeZonesArray.append(Timezone(name: timeZones, abbr: abbreviation))
            }
        }
        
    }
    
    @objc func addButtonTapped() {
        //        let newTimezone = Timezone(name: "Minsk", abbr: "GMT+3")
        //        timeZonesArray.append(newTimezone)
        //        tableView.reloadData()
        view.addSubview(eventView)
        eventView.backgroundColor = .lightGray
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeZonesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        cell.configure(event: events[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
