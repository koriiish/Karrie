//
//  Enums.swift
//  Lesson3011
//
//  Created by Карина Дьячина on 30.11.23.
//

import Foundation
enum Distance {
    case kilometres
    case miles
    case metres
}

enum CatBreeds {
    case shorthair(String)
    case balinese(String)
    case persian(String)
}

enum Location {
    case coordinate(Double, Double, Double)
    case gps(Double, Double, Double)
}

enum SchoolMarks {
    case grade(String, String, String)
}

enum Pizza {
    case small(inches: Int)
    case medium(inches: Int)
    case large(inches: Int)
}
enum Cars: String {
    case audi = "Audi Q7"
    case bmw = "BMW M4"
    case mercedes = "Mercedes E63"
}

enum Weeks: CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var today: String {
        switch self {//обращается ко всем вариантам из инам
        case .monday:
            return "Today is Monday"
        case .tuesday:
            return "Today is Tuesday"
        case .wednesday:
            return "Today is Wednesday"
        case .thursday:
            return "Today is Thursday"
        case .friday:
            return "Today is Friday"
        case .saturday:
            return "Today is Saturday"
        case .sunday:
            return "Today is Sunday"
            //Weeks.tuesday.today
        }
    }
}

enum SocialMedia {
    case telegram
    case whatsApp
    case instagram
    case tiktok
    
    var url: String {
        switch self {
        case .telegram:
            return "t.me/"
        case .instagram:
            return "https://www.instagram.com/"
        case .whatsApp:
            return "+375 xxx xx xx"
        case .tiktok:
            return "tiktok.com/"
        }
    }
}

enum Phone {
    enum iPhone {
        case iphone5s
        case iphoneX
        case iphoneXS
        case iphone13
        case iphone15
    }
    
    enum Android {
        case samsung
        case xiaomi
        case huawei
        case googlePixel
    }
    
    case iphoneUser(phoneType: iPhone)
    case androidUser(phoneType: Android)
    
    func getPhoneType() -> String {
        switch self {
        case let .iphoneUser(phoneType):
            return "The users phone is \(phoneType)"
        case let .androidUser(phoneType):
            return "The users phone is \(phoneType)"
        }
    }
}

enum ChangeStateSwitch {
    case off
    case low
    case high
    
    mutating func next() {//каждая следующая будет выполняться
        switch self {
        case .off:
            self = .low
            print("The light state is low")
        case .low:
            self = .high
            print("The light state is high")
        case .high:
            self = .off
            print("The light state is off")
        }
    }
}
// Пример Томы
enum IPAddressDetector {
    case blackList
    case whiteList
    case greyList
    
    var yourStatus: String {
        switch self {
        case .blackList:
            return "You are banned. Access denied"
        case .whiteList:
            return "Youn are welcome!"
        case .greyList:
            return "Last chance"
        }
    }
    mutating func changeStatus(){
        switch self {
        case .blackList:
            self = .whiteList
        case .whiteList:
            self = .greyList
        case .greyList:
            self = .blackList
        }
    }
}
