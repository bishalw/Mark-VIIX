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
    @IBOutlet var addSubscriptionsButton: UIBarButtonItem!
    
    @IBOutlet var settingsButton: UIBarButtonItem!

    private var models: [Subscription] = []
    
    
    @IBAction func addSubscriptionsButtonPressed(_ sender: UIBarButtonItem) {
        print("buttonpressed")
             let addSubscriptionViewController = AddSubscriptionViewController.instantiateFromStoryBoard()
             let navigationController = UINavigationController(rootViewController: addSubscriptionViewController)
    
             navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
             self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func settingsButtonPressed(){
        let settingsViewController = SettingsViewController.instantiateFromStoryBoard()
        settingsViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.present(settingsViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // registerIN do?
        SubscriptionTableViewCell.registerIn(tableView: tableView)
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let subscriptionViewController = SubscriptionEditTableViewController.instantiateFromStoryBoard()
        let navigationController = UINavigationController(rootViewController: subscriptionViewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

