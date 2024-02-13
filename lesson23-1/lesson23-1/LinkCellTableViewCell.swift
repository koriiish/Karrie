//
//  LinkCellTableViewCell.swift
//  lesson23-1
//
//  Created by Карина Дьячина on 13.02.24.
//

import UIKit

class LinkCellTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      //  setupTitleLabel()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
    }
    
    override required init?(coder: NSCoder) {
        super .init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.frame = CGRect(x: 75, y: 50, width: 150, height: 20)
        
        addSubview(titleLabel)
    }

    func configure(titleText: String) {
        titleLabel.text = titleText
    }
    
}
