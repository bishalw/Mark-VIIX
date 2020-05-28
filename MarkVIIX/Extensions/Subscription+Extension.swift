//
//  Subscription+Extension.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/25/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Computed variables
extension Subscription {
    var icon: UIImage? {
        return UIImage(named: self.iconName)
    }
    var currencyString : String {
        guard let currency = currency else {
            return  ""
        }
        return "$ \(currency)"
    }
    var firstBillDateString : String {
        guard let firstBill = firstBill else {
            return ""
        }
        let date = Date(timeIntervalSince1970: firstBill)
        return date.asString(style: .short)
    }
}

// MARK:- All subscriptions
extension Subscription {
    static var allSubscriptions: [Subscription] = [Netflix, Hulu]
    
    static var Netflix = Subscription(name: "Netflix", description: nil, cost: nil, iconName: "icon_netflix.jpg", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Hulu = Subscription(name: "Hulu", description: nil, cost: nil, iconName: "icon_hulu.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Dropbox = Subscription(name: "Dropbox", description: nil, cost: nil, iconName: "icon_dropbox.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Evernote = Subscription(name: "Evernote", description: nil, cost: nil, iconName: "icon_evernote.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Tmobile = Subscription(name: "Tmobile", description: nil, cost: nil, iconName: "icon_tmobile.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var LinkedIn = Subscription(name: "LinkedIN", description: nil, cost: nil, iconName: "icon_linkedin.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Squarespace = Subscription(name: "SqaureSpace", description: nil, cost: nil, iconName: "icon_Squarespace.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Xboxlive = Subscription(name: "XboxLive", description: nil, cost: nil, iconName: "icon_xboxlive.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var PlayStationPlus = Subscription(name: "PlaysationPlus", description: nil, cost: nil, iconName: "icon_playstationplus.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var ATT = Subscription(name: "AT&T", description: nil, cost: nil, iconName: "icon_at&t .png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Verizon = Subscription(name: "Verizon", description: nil, cost: nil, iconName: "icon_verizon.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    
    static var Sprint = Subscription(name: "Sprint", description: nil, cost: nil, iconName: "icon_sprint.png", firstBill: nil, cycle: nil, duration: nil, remindMe: nil, currency:nil)
    

    
}

extension Subscription {
    static func makeFake() -> Subscription {
        return Subscription(name: "Netflix",
                            description: nil,
                            cost: 10,
                            iconName: "icon_netflix.jpg",
                            firstBill: 0,
                            cycle: 0,
                            duration: 0,
                            remindMe: 0,
                            currency: 0)
    }
}

