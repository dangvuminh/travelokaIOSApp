//
//  dateFormatter.swift
//  traveloka
//
//  Created by macbook pro on 02/03/2024.
//

import Foundation

func dateFormatterToString(date: Date, format: String?) -> String {
    let dateFormatterComp = DateFormatter()
    dateFormatterComp.dateFormat = format ?? "MMM dd,yyyy"
    return dateFormatterComp.string(from: date)
}
