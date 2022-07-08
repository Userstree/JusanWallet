//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//


import Foundation

extension DateFormatter {
    
    static func fullDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
    
    static func hoursMinutesDateFormatter() -> DateFormatter {
        let hoursMinutesFormatter = DateFormatter()
        hoursMinutesFormatter.dateFormat = "HH:mm"
        return hoursMinutesFormatter
    }
    
    static func dayMonthDateFormatter() -> DateFormatter {
        let dayMonthDateFormatter = DateFormatter()
        dayMonthDateFormatter.dateFormat = "EEEE, MMMM dd"
        return dayMonthDateFormatter
    }
}
