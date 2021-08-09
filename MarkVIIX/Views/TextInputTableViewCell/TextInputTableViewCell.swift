//
//  TextInputTableViewCell.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 6/6/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import Foundation

class TextInputTableViewCell: UITableViewCell, XibLoadable {
    static var nibName: String = "TextInputTableViewCell"
    static var reuseId: String = "TextInputTableViewCell"
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var textField: UITextField!
    
    private var _title: String?
    private var _answer: String?
}

extension TextInputTableViewCell {
    var title: String? {
        set {
            self.titleLabel?.text = newValue
        }
        
        get {
            return self.titleLabel?.text
        }
    }
    
    var answer: String? {
        set {
            self.textField?.text = newValue
        }
        
        get {
            return self.textField?.text
        }
    }
    
    var placeHolder: String? {
        set {
            self.textField?.placeholder = newValue
        }
        
        get {
            return self.textField?.placeholder
        }
    }
}

