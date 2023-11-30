//
//  ViewController.swift
//  Lesson3011
//
//  Created by Карина Дьячина on 30.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    /* let intOptionalValue: Int? = 42
     let stringOptionalValue: String? = "This is a string"
     let nilCoalesingValue: Int? = nil
     let guardValue: Double = 15.0 */
    
    /* это пример 1 писал
     let intOptionalValue: Int? = 42
     let nilCoalesingValue: Double? = nil
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* это пример 1 писал
         let unwrapUncollising = nilCoalesingValue ?? 0.3221
         print(unwrapUncollising)
         
         guard let unwrapGuard = intOptionalValue else {
         print ("Не имеет значения")
         return
         }
         print(unwrapGuard)
         */
        //это все способы как развернуть опционал
        // 1 это optional binding (переменную объявили локально, условий нет)
        /* if let unwrapValue = intOptionalValue {
         print("Значение опционала: \(unwrapValue)")
         } else {
         print("Опционал не содержит значения")
         }
         
         // 2 (явный вызов значения и не важно nil или нет)
         let unwrapStringValue = stringOptionalValue!
         print(unwrapStringValue)
         // 3 замена для force unwrap (на месте 5 может быть любое число или переменная Int (nil coaliscing operator)
         let unwrapNilCoalesing = nilCoalesingValue ?? 5
         print(unwrapNilCoalesing)
         //4 Guard let (замена для force unwrap и nil coaliscing)
         let guardValueUnwrap = guardValueUnwrap(value: guardValue)
         print(guardValueUnwrap)
         func guardValueUnwrap(value: Double?) {
         guard let number = value else {
         print("Значение отсутствует")
         return
         }
         print ("Значение есть")
         }
         //5 через Switch case (лучше для большего кол-ва значений)
         switch stringOptionalValue {
         case let .some(value):
         print("Значение есть. \(value)")
         case .none:
         print("Значение отсутствует")
         }
         */
 //       func guardReturnValue(value: String?) -> String? {
  //          guard let text = value else {
 //               return ""
 //           }
 //           return text
  //      }
  //          let guardtest = guardReturnValue(value: "Guard test")
  //                  print(guardtest)
 
        let distance = Distance.kilometres
        print(distance)
        
        
        let catBreed = CatBreeds.shorthair("American Shorthair")
        print(catBreed)
        
        let location = Location.coordinate(43645.43, 678849.45, 243525.54)
        print(location)
        
        let mathGrade = SchoolMarks.grade("A", "B", "A")
        print(mathGrade)
        
        let orderedPizza = Pizza.medium(inches: 12)
        print(orderedPizza)
        
        let cars = Cars.audi
        print(cars.rawValue)
        
        let socialMedia = SocialMedia.whatsApp
        print(socialMedia.url)
        
        let daysOfWeek = Weeks.tuesday.today
        print(daysOfWeek)
        //
        let phone = Phone.iPhone.iphone13
        let android = Phone.Android.samsung
        let iphoneUser = Phone.iphoneUser(phoneType: phone)
        print(iphoneUser.getPhoneType())
        
        var turnLightState = ChangeStateSwitch.off
                turnLightState.next()
                turnLightState.next()
                turnLightState.next()
        //Пример Томы
        var statusList = IPAddressDetector.greyList
        print(statusList)
        
        statusList.changeStatus()
        print(statusList)
        statusList.changeStatus()
        print(statusList)
        statusList.changeStatus()
        print(statusList)
        }
    }

