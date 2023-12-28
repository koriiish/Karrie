//
//  CellOne.swift
//  TableView2812
//
//  Created by Карина Дьячина on 28.12.23.
//

import UIKit
class CellOne: UITableViewCell{
    
     var imageViewOur: UIImageView = {
        let imageViewOur = UIImageView()
        imageViewOur.translatesAutoresizingMaskIntoConstraints = false
        return imageViewOur
    }()
    
     var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       addViews()
       setupConstraints()
        label.textColor = .black
        contentView.backgroundColor = .lightGray
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewOur.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageViewOur.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            imageViewOur.widthAnchor.constraint(equalToConstant: 60),
            imageViewOur.heightAnchor.constraint(equalToConstant: 60),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.leftAnchor.constraint(equalTo: imageViewOur.rightAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 40),
            label.heightAnchor.constraint(equalToConstant: 20),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            button.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 60),
            button.heightAnchor.constraint(equalToConstant: 20),
            contentView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
        func addViews() {
            contentView.addSubview(imageViewOur)
            contentView.addSubview(label)
            contentView.addSubview(button)
        }
    
    func configure(test: Test) {
        imageViewOur.image = UIImage(named: "picture")
        label.text = test.label
        button.setTitle("Start", for: .normal)
    }
}
struct Test{
    let image: String
    let label: String
}
