//
//  SubscriptionCustomCell.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/21/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

class SubscriptionCustomCell: UITableViewCell {
    var subscriptionLogo : UIImage?
    var subscriptionName : String?
    var subscriptionCost : Int?
    
    var subscriptionCostView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView
    }()
    
    var mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainImageView)
        self.addSubview(subscriptionCostView)
        mainImageView.leftAnchor.constraint(equalToSystemSpacingAfter: <#T##NSLayoutXAxisAnchor#>, multiplier: <#T##CGFloat#>)
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
