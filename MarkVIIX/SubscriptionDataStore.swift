//
//  SubscriptionDataStore.swift
//  MarkVIIX
//
//  Created by Bishal W on 9/1/21.
//  Copyright © 2021 Bishal Wagle. All rights reserved.
//

import Foundation

class SubscriptionDataStore{
    //singleton shared object
    static let shared: SubscriptionDataStore = SubscriptionDataStore()
    private var defaults = UserDefaults.standard
    //private init to prevent multiple object creation.
    private init() {}
}


extension SubscriptionDataStore {
    var usersSubscriptionList: [Subscription]
    {
        get {
            getUsersSubscriptionList()
        }
    }
    
    func addSubscription(subscription: Subscription) {
        var list = self.usersSubscriptionList
        guard !list.contains(where: { item in
            item.name == subscription.name
        }) else { return }
        list.append(subscription)
        
        let dataArray = list.compactMap { subscription in
            return subscription.asJsonData
        }
        // One liner for the code above:
        // let dataArray2 = list.compactMap { $0.asJsonData }
        
        defaults.setValue(dataArray, forKey: UserDefaultKeys.SUBSCRIPTION_LIST)
    }
    
    func clearAll() {
        defaults.setValue([], forKey: UserDefaultKeys.SUBSCRIPTION_LIST)
    }
}

private extension SubscriptionDataStore {

    enum UserDefaultKeys {
        static let SUBSCRIPTION_LIST = "USER_DEFAULT_SUBSCRIPTION_LIST_KEY"
    }
    
    func getUsersSubscriptionList() -> [Subscription] {
        //Unwrapping nillable objects using guard
        guard let dataArray = defaults.object(forKey: UserDefaultKeys.SUBSCRIPTION_LIST) as? [Data] else { return [] }
        let subscriptions = dataArray.compactMap { data in
            return Subscription.initFromJsonData(data)
        }
        return subscriptions
    }
}




