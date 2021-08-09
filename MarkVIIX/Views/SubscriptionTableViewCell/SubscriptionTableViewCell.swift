//
//  SubscriptionTableViewCell.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/24/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

class SubscriptionTableViewCell: UITableViewCell, XibLoadable {
    //MARK:- Static Variables
    static var nibName: String = "SubscriptionTableViewCell"
    static var reuseId: String = "SubscriptionTableViewCell"

    //MARK:- Outlets
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var firstBillLabel: UILabel!
    
    
    func configure(subscription: Subscription) {
        //TODO:- BISHAL
        iconImageView.image = subscription.icon
        titleLabel.text = subscription.name
        descriptionLabel.text = subscription.description
        currencyLabel.text = subscription.currencyString
        firstBillLabel.text = subscription.firstBillDateString
    }
}


