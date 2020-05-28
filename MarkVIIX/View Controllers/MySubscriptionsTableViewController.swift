//
//  MySubscriptionsTableViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/20/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit


class MySubscriptionsTableViewController: UITableViewController{
    
    private var models: [Subscription] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: SubscriptionTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SubscriptionTableViewCell.reuseId)
        
        for _ in 0...20 {
            models.append(Subscription.makeFake())
        }
      
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    // creates new cell and returns cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionTableViewCell.reuseId, for: indexPath)  as? SubscriptionTableViewCell {
            //TODO:- Configure eg. cell.configure(subscription: models[indexPath.row])
            let model = models[indexPath.row]
            cell.configure(subscription: model)
            
            return cell
        } else {
            print("Subscriptionviewcell not found")
            return UITableViewCell()
        }
    }
}


