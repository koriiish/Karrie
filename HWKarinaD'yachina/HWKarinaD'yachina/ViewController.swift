//
//  ViewController.swift
//  HWKarinaD'yachina
//
//  Created by Карина Дьячина on 28.11.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let first = 2.5
        let second = 9.7
        let third = 6.9
        let forth = 8.2
        
        let firstInt = Int(first)
        let secondInt = Int(second)
        let thirdInt = Int(third)
        let forthInt = Int(forth)
        
        let sum = firstInt + secondInt + thirdInt + forthInt
        print(sum)
        
        
        let firstDouble = first.truncatingRemainder(dividingBy: 1)
        let secondDouble = second.truncatingRemainder(dividingBy: 1)
        let thirdDouble = third.truncatingRemainder(dividingBy: 1)
        let forthDouble = forth.truncatingRemainder(dividingBy: 1)
        
        let sumDouble = firstDouble + secondDouble + thirdDouble + forthDouble
        print(sumDouble)
        
        //проверка на четные/нечетные через цикл for in
        let numbers = [2, 9, 6, 8]
        for number in numbers{
            number % 2 == 0 ? print ("Число четное") : print ("Число нечетное")
            }
        }
        //проверка на четное число

      /*  let isNumberEven = firstInt % 2
        if isNumberEven == 0{
            print ("Число четное")
        } else {
            print ("Число нечетное")
        }
        
        let isNumberEvenTwo = secondInt % 2
        if isNumberEvenTwo == 0{
            print ("Число четное")
        } else {
            print ("Число нечетное")*/
        
        
        
    }


