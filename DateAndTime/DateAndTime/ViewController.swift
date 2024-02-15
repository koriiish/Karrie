//
//  ViewController.swift
//  DateAndTime
//
//  Created by berdy on 15.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    let currentDate = Date()
    var components = DateComponents()
    let seconds: TimeInterval = 3600
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .day, value: 5, to: startDate)!
        
        components.day = 1
        let minutes = seconds / 60
        let date = Calendar.current.date(from: components)
        print("Текущая дата: \(currentDate)")
        print(date ?? "Не удалось создать дату")
        
        print("В \(seconds) секундах - \(minutes) минут")
        
        let modifyDate = Calendar.current.date(byAdding: components, to: currentDate)
        
        print(modifyDate)
        
        
        let oneHourLater = currentDate.addingTimeInterval(seconds)
        let utcTime = Calendar.current.timeZone
        print(currentDate.description)
        
        var componentsParams = Calendar.current.dateComponents([.year, .month, .day], from: currentDate)
        let customDate = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: currentDate)
        let difference = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
        
        
        componentsParams.year = 2024
        componentsParams.month = 2
        componentsParams.day = 15
        
        
        print("Год: \(componentsParams.year ?? 0), Месяц: \(componentsParams.month ?? 0), День: \(componentsParams.day ?? 0)")
        
        /*
         "yyyy-MM-dd HH:mm:ss"
         "yyyy-MM-dd"
         "EEEE, MMM d, yyyy HH:mm:ss"
         "EEEE, MMM d, yyyy"
         "HH:mm:ss"
         "h:mm a"
         "MMMM"
         "EEEE"
         "dd.MM.yy"
         */
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss" //
        
        let formattedDate = dateFormatter.string(from: currentDate)
        print("Дата: \(formattedDate)")
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date

        let selectedDate = datePicker.date
        print("Выбранная дата: \(selectedDate)")
        
        
        let formattedDateToString = dateFormatter.string(from: currentDate)
        
        let minDate = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)
        let maxDate = Calendar.current.date(byAdding: .year, value: 1, to: currentDate)
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        let currentTimeZone = TimeZone.current
        print("Текущая временная зона: \(currentTimeZone)")

        if let newYorkTimeZone = TimeZone(identifier: "America/New_York") {
            print("Временная зона для New York: \(newYorkTimeZone)")
        } else {
            print("Недопустимый идентификатор временной зоны")
        }

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        let dateInUTC = dateFormatter.date(from: "2024-02-15 12:00:00")!

        let targetTimeZone = TimeZone(identifier: "America/New_York")!

        dateFormatter.timeZone = targetTimeZone
        let dateInNewYork = dateFormatter.string(from: dateInUTC)

        print("Дата в UTC: \(dateFormatter.string(from: dateInUTC))")
        print("Дата в Нью-Йорке: \(dateInNewYork)")


        let knownTimeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
        for timeZones in TimeZone.knownTimeZoneIdentifiers {
            let timeZone = TimeZone(identifier: timeZones)
            if let abbreviation = timeZone?.abbreviation(), let seconds = timeZone?.secondsFromGMT() {
                print ("timeZone: \(timeZones) \nabbreviation: \(abbreviation)\nsecondsFromGMT: \(seconds)\n")
            }
        }
    }
}

/*
 "yyyy-MM-dd HH:mm:ss"
 "yyyy-MM-dd"
 "EEEE, MMM d, yyyy HH:mm:ss"
 "EEEE, MMM d, yyyy"
 "HH:mm:ss"
 "h:mm a"
 "MMMM"
 "EEEE"
 "dd.MM.yy"
 */

/*
 ADT = "America/Halifax";
 AKDT = "America/Juneau";
 AKST = "America/Juneau";
 ART = "America/Argentina/Buenos_Aires";
 AST = "America/Halifax";
 BDT = "Asia/Dhaka";
 BRST = "America/Sao_Paulo";
 BRT = "America/Sao_Paulo";
 BST = "Europe/London";
 CAT = "Africa/Harare";
 CDT = "America/Chicago";
 CEST = "Europe/Paris";
 CET = "Europe/Paris";
 CLST = "America/Santiago";
 CLT = "America/Santiago";
 COT = "America/Bogota";
 CST = "America/Chicago";
 EAT = "Africa/Addis_Ababa";
 EDT = "America/New_York";
 EEST = "Europe/Istanbul";
 EET = "Europe/Istanbul";
 EST = "America/New_York";
 GMT = GMT;
 GST = "Asia/Dubai";
 HKT = "Asia/Hong_Kong";
 HST = "Pacific/Honolulu";
 ICT = "Asia/Bangkok";
 IRST = "Asia/Tehran";
 IST = "Asia/Calcutta";
 JST = "Asia/Tokyo";
 KST = "Asia/Seoul";
 MDT = "America/Denver";
 MSD = "Europe/Moscow";
 MSK = "Europe/Moscow";
 MST = "America/Denver";
 NZDT = "Pacific/Auckland";
 NZST = "Pacific/Auckland";
 PDT = "America/Los_Angeles";
 PET = "America/Lima";
 PHT = "Asia/Manila";
 PKT = "Asia/Karachi";
 PST = "America/Los_Angeles";
 SGT = "Asia/Singapore";
 UTC = UTC;
 WAT = "Africa/Lagos";
 WEST = "Europe/Lisbon";
 WET = "Europe/Lisbon";
 WIT = "Asia/Jakarta";
 */

//MARK: - ТЗ на урок

/*
 Разработать приложение для управления событиями и задачами с поддержкой различных временных зон и возможностью форматирования дат.
 
 Пользователь может создавать новые события, указывая заголовок, описание, и дату события.
 
 Дата события должна быть вводима с использованием календаря и времени, с учетом текущей временной зоны устройства.
 
 События должны отображаться в соответствии с текущей временной зоной устройства.
 
 Пользователь должен иметь возможность просматривать события в различных временных зонах.
 
 Реализовать возможность выбора формата отображения даты и времени.
 
 Дата и время события должны быть форматированы в соответствии с выбранным форматом.
 
 Пользователь может изменять временную зону для отображения событий, учитывая различные географические положения.
 
 При изменении временной зоны события должны автоматически корректироваться в соответствии с новой зоной.
 
 Реализовать возможность установки уведомлений для событий.
 
 Уведомления должны быть настроены с учетом временной зоны пользователя.
 
 Приложение должно поддерживать работу с различными временными зонами и форматами дат, поддержка всех доступных языков.
 
 Данные о событиях должны сохраняться надежно и быть доступными даже после перезапуска приложения.
 
 Данные о событиях должны храниться в безопасной форме, и доступ к ним должен быть ограничен только авторизованным пользователям.
 
 */
