//
//  EventTableViewCell.swift
//  lesson24project
//
//  Created by Карина Дьячина on 15.02.24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    enum Constants {
        static let labelsLeftAnchor: CGFloat = 10
        static let titleLabelTopAnchor: CGFloat = 5
        static let descriptionLabelTopAnchor: CGFloat = 10
        static let dateLabelRightAnchor: CGFloat = -10
    }
    
    
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
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelsLeftAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleLabelTopAnchor),
       
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelsLeftAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.descriptionLabelTopAnchor),
        
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.dateLabelRightAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(event: Event) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        dateLabel.text = event.date
    }
    
}
