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
    private lazy var searchBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Add",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(searchBarButtonPressed(_:)))
        return navButton
    }()
    
    private lazy var dismissBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Cancel",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(dismissBarButtonPressed(_:)))
        return navButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.navigationItem.rightBarButtonItem = searchBarButton
    }
    
    @objc func dismissBarButtonPressed(_ barbutton: UIBarButtonItem){
        
    }
    @objc func searchBarButtonPressed(_ barbutton: UIBarButtonItem){
          
    }
}

extension AddSubscriptionViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "AddSubscriptionViewController"
}


