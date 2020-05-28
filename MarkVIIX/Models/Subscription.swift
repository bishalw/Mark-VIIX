//
//  Subscription.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/21/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation

struct Subscription {
    var name: String
    var description: String?
    var cost: Double?
    var iconName: String
    var firstBill: TimeInterval?
    var cycle: TimeInterval?
    var duration: TimeInterval?
    var remindMe: TimeInterval?
    var currency: TimeInterval?
}
