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
        DatePickerTableViewCell.registerIn(tableView: self.tableView)
        self.navigationItem.leftBarButtonItem = dismissBarButton
        self.navigationItem.rightBarButtonItem = saveBarButton
        setStateFromSubscription(subscription: nil)
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
        var variable: Variable
        
        enum CellType {
            case textDisplay(value: String?)
            case textEdit(value: String?)
            case pickDate(value: Date?)
            case pickCycle(value: Int?)
            case pickDuration(value: Int?)
        }
        
        enum Variable {
            case name
            case description
            case firstBillDate
        }
    }
    
    struct State {
        var cells: [Cell]
   }
    
    var dateIsEditing = false
    
    var state: State = State(cells: [])
        
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
            tableViewCell.cell = cell
            tableViewCell.answerChanged = self.textViewAnswerChanged
            return tableViewCell
        case .pickDate(let value):
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.reuseId, for: indexPath) as! DatePickerTableViewCell
            return tableViewCell
        case .pickCycle(let value):
            break
        case .pickDuration(let value):
            break
        }
        return UITableViewCell()
    }
    
    func textViewAnswerChanged(cell: Cell, updatedAnswer: String?) {
        var cells = self.state.cells
        for index in 0..<cells.count {
            var tempCell = cells[index]
            guard tempCell.variable == cell.variable else { continue }
            
            switch cell.type {
            case .textEdit:
                tempCell.type = .textEdit(value: updatedAnswer)
                cells[index] = tempCell
            default:
                break
            }
        }
        self.state = State(cells: cells)
    }
    
}

extension SubscriptionEditTableViewController {
    var subscription: Subscription? {
        get {
            getSubscriptionFromState()
        }
        set {
            setStateFromSubscription(subscription: newValue)
        }
    }
}

private extension SubscriptionEditTableViewController {
    
    func setStateFromSubscription(subscription: Subscription?) {
        var cells = [Cell]()
        cells.append(Cell(title: "Name", placeHolder: "Enter Name", type: .textEdit(value: subscription?.name), variable: .name))
        cells.append(Cell(title: "Description", placeHolder: "Enter A Description", type: .textEdit(value: subscription?.description), variable: .description))
        cells.append(Cell(title: "Date", type: .pickDate(value: subscription?.firstBillDate), variable: .firstBillDate))
        self.state = State(cells: cells)
    }
    
    func getSubscriptionFromState() -> Subscription? {
        var name: String?
        var description: String?
        var firstBillDate: Date?
        
        let cells = self.state.cells
        
        for item in cells {
            switch (item.variable, item.type)  {
            case (.name, .textEdit(value: let value)):
                name = value
            case (.description, .textEdit(value: let value)):
                description = value
            case (.firstBillDate, .pickDate(value: let value)):
                firstBillDate = value
            default:
                break
            }
        }
        
        guard let name = name else { return nil }
        
        let subscription = Subscription(name: name,
                                        description: description,
                                        cost: nil,
                                        iconName: Subscription.NetflixIcon,
                                        firstBill: firstBillDate?.timeIntervalSince1970,
                                        cycle: nil,
                                        duration: nil,
                                        remindMe: nil,
                                        currency: nil)
        return subscription
    }
    
    
}


extension SubscriptionEditTableViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "SubscriptionEditTableViewController"
    
}
