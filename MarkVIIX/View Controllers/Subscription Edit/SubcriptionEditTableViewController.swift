//
//  SubscriptionEditTableViewController.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 6/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import Foundation

class SubscriptionEditTableViewController: UITableViewController {
    private lazy var saveBarButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem(title: "Save",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(saveBarButtonPressed(_:)))
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
        self.title = "Subscription"
        super.viewDidLoad()
        TextInputTableViewCell.registerIn(tableView: self.tableView)
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.navigationItem.rightBarButtonItem = saveBarButton
    }
    
    func configure(subscription: Subscription) {
        //TODO:- Create State Using subscription
    }
        
    @objc func dismissBarButtonPressed(_ barbutton: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
 
    @objc func saveBarButtonPressed(_ barbutton: UIBarButtonItem){
        //TODO:- Save Logic
    }
    
    struct Cell {
        var title: String?
        var placeHolder: String?
        var type: CellType
        
        enum CellType {
            case textDisplay(value: String?)
            case textEdit(value: String?)
            case pickDate(value: Date?)
            case pickCycle(value: Int?)
            case pickDuration(value: Int?)
        }
    }
    
    struct State {
        var cells: [Cell]
    }
    
    var state: State = State(cells: [
        Cell(title: "Name", placeHolder: "Enter Name", type: .textEdit(value: "")),
        Cell(title: "Description", placeHolder: "Enter A Description", type: .textEdit(value: "This was the description"))])
}

extension SubscriptionEditTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = state.cells[indexPath.row]
        switch cell.type {
        case .textDisplay(let value):
            break
        case .textEdit(let value):
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TextInputTableViewCell.reuseId, for: indexPath) as! TextInputTableViewCell
            tableViewCell.title = cell.title
            tableViewCell.answer = value
            tableViewCell.placeHolder = cell.placeHolder
            return tableViewCell
        case .pickDate(let value):
            break
        case .pickCycle(let value):
            break
        case .pickDuration(let value):
            break
        }
        return UITableViewCell()
    }
}


extension SubscriptionEditTableViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "SubscriptionEditTableViewController"
    
}
    
    

