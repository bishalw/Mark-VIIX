//
//  SubscriptionViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/28/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

class SubscriptionViewController: UIViewController {
    @IBOutlet private var containerView: UIView!
    
    private lazy var subscriptionEditVC = SubscriptionEditTableViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        subscriptionEditVC = SubscriptionEditTableViewController.instantiateFromStoryBoard()
        UIViewController.embed(subscriptionEditVC, inParent: self, inView: containerView)
       
        
    }
    
}
extension SubscriptionViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "SubscriptionViewController"
    
    
}


