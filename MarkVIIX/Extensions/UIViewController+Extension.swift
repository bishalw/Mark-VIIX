//
//  UIViewController+Extension.swift
//  MarkVIIX
//
//  Created by Bishal Wagle on 6/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    static func embed(_ viewController:UIViewController, inParent controller:UIViewController, inView view:UIView){
       viewController.willMove(toParent: controller)
       viewController.view.frame = view.bounds
       view.addSubview(viewController.view)
       controller.addChild(viewController)
       viewController.didMove(toParent: controller)
    }

}
