//
//  MySubscriptionsTableViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/20/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

struct CellData{
    
    let subscriptionLogo : UIImage?
    let subscriptionName : String?
    let subscriptionCost : Int?
    
}

class MySubscriptionsTableViewController: UITableViewController{
    
    var data = [CellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [CellData.init(subscriptionLogo: UIImage?, subscriptionName: "dropbox", subscriptionCost: 20)]
    }
    
    
    let models = ["apple","orange","mango","watermelon","cherry","grapes","strawberry","mandarin", "guava","papaya","a","b","c","d","e","f","g","h","i","j","k","l","m","n"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
}
