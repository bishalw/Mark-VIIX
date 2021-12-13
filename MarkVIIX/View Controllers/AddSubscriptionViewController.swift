//
//  AddSubscriptionViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/30/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//



import Foundation
import UIKit


class AddSubscriptionViewController: UIViewController{
    
    private lazy var dismissBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Cancel",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(dismissBarButtonPressed(_:)))
        return navButton
    }()
    private lazy var addBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Add",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(addBarButtonPressed(_:)))
        return navButton
    }()
    
    

    private var subscriptionViewController = SubscriptionViewController.instantiateFromStoryBoard()
    override func viewDidLoad() {
        self.title = "New Subscription"
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.navigationItem.rightBarButtonItem = addBarButton
        //UIViewController.embed(subscriptionViewController, inParent: self, inView: self.view)
    }
    
    @objc func dismissBarButtonPressed(_ barbutton: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
        
    }
    @objc func addBarButtonPressed(_ barbutton: UIBarButtonItem){
          
    }
}

extension AddSubscriptionViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "AddSubscriptionViewController"
}


