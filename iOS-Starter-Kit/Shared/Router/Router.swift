//
//  Router.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Router Type
enum RouterType {
    case root
    case push
    case present
}

//
// MARK: - Basic Router protocol
protocol Router {
    
    // Associatedtype for kind of router
    associatedtype Element: UIViewController
    
    // Type
    var routerType: RouterType {get}
    
    // View controller
    var viewController: Element {get}
    
    // Passing data between to router
    func handleData(_ block: (Element) -> Void)
}

//
// MARK: - Extend Router
extension Router {
    
    // Passing data
    func handleData(_ block: (Element) -> Void) {
        block(self.viewController)
    }
}
