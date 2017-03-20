//
//  Identifier.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/19/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Identitifer protocol
protocol Identifier {
    
    // Static vartiable to get id of object
    static var identifier: String {get}
}

//
// MARK: - Exntension
extension Identifier {
    
    static var identifier: String {
        return String(describing: self)
    }
}

//
// MARK: - Conform automatically
extension UIViewController: Identifier {}
extension UIView: Identifier {}
