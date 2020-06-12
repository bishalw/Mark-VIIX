//
//  UIbarButton+Extension.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 6/2/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation

extension UIButton {
    class func addBarButton(tittle:String,_ target: Any, action: Selector) -> UIBarButtonItem{
        let button = UIButton(type: .system)
        button.setTitle(tittle, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
}
