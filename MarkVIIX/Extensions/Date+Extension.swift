//
//  Date+Extension.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/25/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation

extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
    
}
