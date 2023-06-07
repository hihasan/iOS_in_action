//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Hasan Al Mamun on 20/5/23.
//

import SwiftUI
import Foundation

extension Color{
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter{
    static let allNumericBD : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericBD.date(from: self) else {return Date()}
        
        return parsedDate
    }
}
