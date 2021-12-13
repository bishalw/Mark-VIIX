//
//  Subscription.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/21/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation

struct Subscription: Codable {
    var name: String
    var description: String?
    var cost: Double?
    var iconName: String?
    var firstBill: TimeInterval?
    var cycle: TimeInterval?
    var duration: TimeInterval?
    var remindMe: TimeInterval?
    var currency: TimeInterval?
    
    static var NetflixIcon: String = "icon_netflix.jpg"
}


extension Subscription {
    var asJsonData: Data? {
        let jsonEncoder = JSONEncoder()
        return try? jsonEncoder.encode(self)
    }
    
    static func initFromJsonData(_ data: Data) -> Subscription? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(Subscription.self, from: data)
    }
}
