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
    
    @IBOutlet weak var save: UIButton!
    private lazy var dismissBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Cancel",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(dismissBarButtonPressed(_:)))
        return navButton
    }()
    
    private lazy var subscriptionEditVC = SubscriptionEditTableViewController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.save.addTarget(self, action: #selector(saveButtonPressed(sender:)), for: .touchUpInside)
        subscriptionEditVC = SubscriptionEditTableViewController.instantiateFromStoryBoard()
        UIViewController.embed(subscriptionEditVC, inParent: self, inView: containerView)
       
        
    }
    @objc func dismissBarButtonPressed(_ barbutton: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func saveButtonPressed(sender: UIButton){
        guard let subscription = subscriptionEditVC.subscription else { return }
        
        SubscriptionDataStore.shared.addSubscription(subscription: subscription)
        self.dismiss(animated: true, completion: nil)
    }
}

extension SubscriptionViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "SubscriptionViewController"
    
    
}


