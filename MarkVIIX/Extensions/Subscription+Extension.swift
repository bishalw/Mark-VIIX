//
//  Subscription+Extension.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/25/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

// what is the subscription for?

// MARK:- Computed variables
extension Subscription {
    var icon: UIImage? {
        return UIImage(named: self.iconName ?? Subscription.NetflixIcon)
    }
    var currencyString : String {
        guard let currency = currency else {
            return  ""
        }
        return "$ \(currency)"
    }
    var firstBillDateString : String {
        guard let firstBillDate = firstBillDate else {
            return ""
        }
        return firstBillDate.asString(style: .short)
    }
    
    var firstBillDate: Date? {
        guard let firstBill = firstBill else {
            return nil
        }
        return Date(timeIntervalSince1970: firstBill)
    }
}

// MARK:- All subscriptions
extension Subscription {
    static var allSubscriptions: [Subscription] = [Netflix, Hulu]
    
    static var Netflix = Subscription(name: "Netflix", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Hulu = Subscription(name: "Hulu", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Dropbox = Subscription(name: "Dropbox", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Evernote = Subscription(name: "Evernote", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Tmobile = Subscription(name: "Tmobile", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var LinkedIn = Subscription(name: "LinkedIN", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Squarespace = Subscription(name: "SqaureSpace", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Xboxlive = Subscription(name: "XboxLive", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var PlayStationPlus = Subscription(name: "PlaysationPlus", description: nil, cost: nil, iconName:Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var ATT = Subscription(name: "AT&T", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Verizon = Subscription(name: "Verizon", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Sprint = Subscription(name: "Sprint", description: nil, cost: nil, iconName: Subscription.NetflixIcon, firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    

    
}
//why make fake  is an extension?
extension Subscription {
    static func makeFake() -> Subscription {
        return Subscription(name: "Netflix",
                            description: nil,
                            cost: 10,
                            iconName: Subscription.NetflixIcon,
                            firstBill: 0,
                            cycle: 0,
                            duration: 0,
                            remindMe: 0,
                            currency: 0)
    }
    static func makefakeList() -> Subscription{
        return Subscription(name: "Netflix",
                            description: nil,
                            cost: nil,
                            iconName: Subscription.NetflixIcon,
                            firstBill: nil,
                            cycle: nil,
                            duration: nil,
                            remindMe: nil,
                            currency: nil)
    }
}


