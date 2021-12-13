//
//  ListTableViewCell.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 8/21/21.
//  Copyright © 2021 Bishal Wagle. All rights reserved.
//

import UIKit
import Foundation

class ListTableViewCell: UITableViewCell, XibLoadable{
    static var nibName: String = "ListTableViewCell"
    static var reuseId: String = "ListTableViewCell"
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func configure(subscription: Subscription){
        iconImageView.image = subscription.icon
        titleLabel.text = subscription.name
    }
}
