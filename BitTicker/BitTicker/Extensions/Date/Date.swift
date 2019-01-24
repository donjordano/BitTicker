//
//  Date.swift
//
//  Created by Ivan Yordanov
//

import Foundation

extension Date {
    
    public static func getISODateWithString(_ stringDate: String) -> Date? {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SSS'Z'"
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")
        return isoFormatter.date(from: stringDate)
    }
    
    public func getStringMMMddyyyyFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
    
}
