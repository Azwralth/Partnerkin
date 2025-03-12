//
//  Extension + String.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "ru_RU")

        guard let date = inputFormatter.date(from: self) else { return self }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM"
        outputFormatter.locale = Locale(identifier: "ru_RU")

        return outputFormatter.string(from: date)
    }

    func formattedDateWithDuration(endDate: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "ru_RU")

        guard let startDate = inputFormatter.date(from: self),
              let endDate = inputFormatter.date(from: endDate) else { return self }

        let formattedStartDate = self.formattedDate()

        let calendar = Calendar.current
        let daysCount = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        let daysString = daysCount == 1 ? "1 день" : "\(daysCount) дня"

        return "\(formattedStartDate) \(calendar.component(.year, from: startDate)), \(daysString)"
    }
}

