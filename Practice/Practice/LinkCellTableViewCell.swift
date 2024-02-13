//
//  LinkCellTableViewCell.swift
//  Practice
//
//  Created by azinavi on 13/2/24.
//

import UIKit

class LinkCellTableViewCell: UITableViewCell {
    var titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
    }
    
    override required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setupTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.frame = CGRect(x: 100, y: 50, width: 150, height: 20)
        
        addSubview(titleLabel)
        
    }
    
    func configure(titleText: String) {
        titleLabel.text = titleText
    }

}
