//
//  Order.swift
//  DateAndTime
//
//  Created by berdy on 15.02.24.
//

import Foundation

struct Order {
  
  enum State: Int {
    case inProgress
    case finished
    case readyForPayment
    case canceled
  }
  
  var id: Int
  var startDateTime: Double
  var endDateTime: Double
  var sum: Int
  private var orderStatus: Int
  
  var state: State {
    return State(rawValue: orderStatus) ?? .inProgress
  }
  
  var startDate: Date {
    return Date(timeIntervalSince1970: startDateTime)
  }
  
  var endDate: Date {
    return Date(timeIntervalSince1970: endDateTime)
  }
  
  var isMonthRent: Bool {
    return ((endDateTime - startDateTime) / 3600) > 480
  }
}
