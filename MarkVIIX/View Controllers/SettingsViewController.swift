//
//  SettingsViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/30/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController {
    
    private lazy var dismissBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "naviButton",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(dismissButtonPressed(_:)))
        return navButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = dismissBarButton

    }
    
    @objc func dismissButtonPressed(_ barbutton: UIBarButtonItem){
        
    }
}
    


extension SettingsViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "SettingsViewController"
    
}
