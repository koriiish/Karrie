//
//  EventTableViewCell.swift
//  lesson24project
//
//  Created by Карина Дьячина on 15.02.24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    lazy var dateLabel: UILabel = {
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
    }
    
    func setupLabels() {
        //        addSubview(titleLabel)
        //        addSubview(descriptionLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(timezone: Timezone) {
        dateLabel.text = "\(timezone.name) - \(timezone.abbr)"
        
    }
    
//    func getTimeZone(){
//        let knownTimeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
//        for timeZones in TimeZone.knownTimeZoneIdentifiers {
//            let timeZone = TimeZone(identifier: timeZones)
//            if let abbreviation = timeZone?.abbreviation(), let seconds = timeZone?.secondsFromGMT() {
//                print ("timeZone: \(timeZones) \nabbreviation: \(abbreviation)\nsecondsFromGMT: \(seconds)\n")
//                timezoneArray.append(Timezone(name: timeZones, abbr: abbreviation))
//            }
//        }
//        
//    }
}

