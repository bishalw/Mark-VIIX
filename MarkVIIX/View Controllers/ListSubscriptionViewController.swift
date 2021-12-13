//
//  ListSubscriptionViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 8/21/21.
//  Copyright © 2021 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

class ListSubscriptionViewController: UITableViewController {
    
    private lazy var dismissBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Cancel",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(dismissBarButtonPressed(_:)))
        return navButton
    }()
    private lazy var createButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Create",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(createButtonPressed(_:)))
        return navButton
    }()
    private var data: [Subscription] = []
    
    var didDismiss: (() -> Void)? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.navigationItem.rightBarButtonItem = createButton
        
        ListTableViewCell.registerIn(tableView: tableView)
        for _ in 0...20{
            data.append(Subscription.makefakeList())
        }
       
       
        
    }
    
    @objc func dismissBarButtonPressed(_ barbutton: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
        self.didDismiss?()
    }
    
    @objc func createButtonPressed(_ barbutton: UIBarButtonItem){
        let vc = SubscriptionViewController.instantiateFromStoryBoard()
        let navVC = UINavigationController(rootViewController: vc)
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseId, for: indexPath) as? ListTableViewCell{
            
            let listData = data[indexPath.row]
            cell.configure(subscription: listData)
            
            return cell
        } else {
            print("ListTableViewcell not found")
            return UITableViewCell()
        }
    }
}

extension ListSubscriptionViewController: InstantiableFromStoryboard {

    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "ListSubscriptionViewController"
    
    
}

