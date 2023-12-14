//
//  ViewController.swift
//  HW4_Karrie(forL6)
//
//  Created by Карина Дьячина on 11.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    let numbers: Array<Int> = [1, 2, 3, 4, 5, 6]
    var x = [(1, "x"), (4, "y"), (6, "a"), (9, "u"), (5, "k")]
    var noCompactMap = [2, nil, 4, nil, 3, 8, nil]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 1. Функция вычисления факториала числа - через передачу массива в параметр функции. Массив из 6 чисел -> Факториал числа \(numbers), равен ????
        //        func findFactorial (number: [Int]) {
        //            for number in numbers {
        //                var result = 1
        //                while number != 0 {
        //                    result *= number
        //                    number -= 1
        //                }
        //
        //                print(result)
        //            }
        //        }
        //        let numbersFactorial = numbers.map{$0.findFactorial()}
        //        print(numbersFactorial)
        
        
        func findFactorial(_ n: Int) -> Int{
            if n == 0{
                return 1
            }
            return n * findFactorial(n-1)
        }
        
        let result = numbers.map (findFactorial)
        
        print(numbers)
        print(result)
        print("Факториал числа \(numbers), равен \(result)")
        print("Факториал числа \(numbers[0]), равен \(result[0])")
        
        // MARK: 2.  var x = [(1, "x"), (4, "y"), (6, «a»), (9, «u»), (5, «k»)]
        // Массив из кортежей - возвести Int в квадрат
        
        let xX = x.map({($0.0*$0.0, $0.1)})
        print("Ввозведение значений типа Int в квадрат \(xX)")
        
        //  отфильтровать только четные Int -> [4, 6]
        
        let a = x.filter({$0.0 % 2 == 0})
        print("Четные кортежи из массивa: \(a)")
        
        // упорядочить по строкам по возрастанию -> [a, k, u, x, y]
        
        let b = x.sorted(by: {$0.1<$1.1})
        print("Буквы из кортежей по возврастанию: \(b)")
        
        //MARK: ********
        // MARK: 3. Написать список книг и отфильтровать книги по жанрам -> horror = []
        //написала через добавление структуры и пример с person
        
        var books = [
            Book(title: "Swift Programming", author: "John Doe", genre: "Programming"),
            Book(title: "The Alchemist", author: "Paulo Coelho", genre: "Fiction"),
            Book(title: "Silent Hill", author: "Bernar Perron", genre : "Horror"),
            Book(title: "The Shining", author: "Stiven King", genre: "Horror")
        ]
        let horrorFilms = books.filter {$0.genre == "Horror"}
        print(horrorFilms)

        // MARK: 4. объеденить 2 массива. первый массив это название групп. второй название песен
        
        var songs: Set = ["Space", "Diamonds", "Can I", "When We"]
        var authors: Set = ["Skryptonite", "Rihanna", "Drake", "Tank"]
        var songsAndAutors = songs.union(authors)
        print(songsAndAutors)
        
        // MARK: 5.  Создать функцию которая принимает массив чисел и умножает каждое число на 2 используя функцию map.
        // [2, nil, 4, nil, 3, 8, nil] - не использую compactMap
    
        func multiplyNoCompactMap(noCompactMap: Array<Int?>) {
            var muiltipliedNums: Array<Int> = []
            let mulyiplier = 2
            for (i) in noCompactMap {
                if i != nil {
                    muiltipliedNums.append(i! * mulyiplier)
                }
            }
            print(muiltipliedNums)
        }
        multiplyNoCompactMap(noCompactMap: noCompactMap)
    }
    
}
