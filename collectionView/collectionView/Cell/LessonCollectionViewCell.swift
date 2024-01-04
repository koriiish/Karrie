//
//  LessonCollectionViewCell.swift
//  collectionView
//
//  Created by Карина Дьячина on 4.01.24.
//

import UIKit

class LessonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(lesson: Lesson) {
        labelOne.text = lesson.labelOne
        labelTwo.text = lesson.labelTwo
        
    }
}

struct Lesson {
    let labelOne: String
    let labelTwo: String
}
