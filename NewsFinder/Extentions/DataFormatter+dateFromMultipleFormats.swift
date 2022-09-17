//
//  DataFormatter+dateFromMultipleFormats.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 17/09/2022.
//

import Foundation

extension DateFormatter {

    func dateFromMultipleFormats(fromString dateString: String) -> String? {
        var formats: [String] = [
        "yyyy-MM-dd'T'HH:mm:ss'Z'",
        "yyyy-MM-dd hh:mm:ss"
        ]
    for format in formats {
        self.dateFormat = format
        if let date = self.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let resultString = dateFormatter.string(from: date)
                return resultString
            }
        }
        return nil
    }
}
