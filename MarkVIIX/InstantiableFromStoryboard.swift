//
//  InstantiableFromStoryboard.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 5/28/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

protocol InstantiableFromStoryboard: class {
    static var storyBoardName: String { get }
    static var storyBoardIdentifier: String { get }
    static func instantiateFromStoryBoard() -> Self
}

extension InstantiableFromStoryboard where Self: UIViewController {
    static func instantiateFromStoryBoard() -> Self {
        let storyBoard = UIStoryboard(name: Self.storyBoardName, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: Self.storyBoardIdentifier)
        
        guard let selfViewController = viewController as? Self else {
            fatalError("Cannot find storybaord: \(Self.storyBoardName), identifier: \(Self.storyBoardIdentifier)")
        }
        return selfViewController
    }
}


protocol XibLoadable: class {
    static var nibName: String { get }
    static var reuseId: String { get }
}

extension XibLoadable where Self: UIView {
    static var nib: UINib {
        UINib(nibName: Self.nibName, bundle: nil)
    }
}

extension XibLoadable where Self: UITableViewCell {
    static func registerIn(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: Self.reuseId)
    }
}
