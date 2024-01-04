//
//  ViewController.swift
//  collectionView
//
//  Created by Карина Дьячина on 4.01.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var lessonArray: [Lesson] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array1 = Lesson(labelOne: "Name1", labelTwo: "Name1")
        let array2 = Lesson(labelOne: "Name2", labelTwo: "Name2")
        let array3 = Lesson(labelOne: "Name3", labelTwo: "Name3")
                           
        lessonArray.append(array1)
        lessonArray.append(array2)
        lessonArray.append(array3)
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.register(UINib(nibName: "LessonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LessonCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessonArray.count //возвращает количество внутри наших массивов
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCollectionViewCell", for: indexPath) as! LessonCollectionViewCell
        let lesson = lessonArray[indexPath.row]
        cell.configure(lesson: lesson)
        return cell
    }
    
    
}
