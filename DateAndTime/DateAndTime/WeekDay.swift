//
//  WeekDay.swift
//  DateAndTime
//
//  Created by berdy on 15.02.24.
//

import Foundation

enum WeekDay: Int, Codable {
  case sunday = 0
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  
  var titleShort: String {
    switch self {
    case .sunday: return "ВС"
    case .monday: return "ПН"
    case .tuesday: return "ВТ"
    case .wednesday: return "СР"
    case .thursday: return "ЧТ"
    case .friday: return "ПТ"
    case .saturday: return "СБ"
    }
  }
  
  var index: Int {
    guard rawValue != 0 else { return 7 }
    return rawValue
  }
}
