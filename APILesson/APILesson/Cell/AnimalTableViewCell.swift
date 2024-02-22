//
//  AnimalTableViewCell.swift
//  APILesson
//
//  Created by berdy on 22.02.24.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    lazy var idLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var nameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var infoLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLabel() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 15),
            
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10 )
        ])
    }
    
    func configureCats(cats: CatBreed) {
        idLabel.text = cats.temperament
        nameLabel.text = cats.name
        infoLabel.text = cats.description
    }
    
    func configureDogs(dogs: DogBreed) {
        idLabel.text = dogs.temperament
        nameLabel.text = dogs.name
        infoLabel.text = dogs.bredFor
    }
}
