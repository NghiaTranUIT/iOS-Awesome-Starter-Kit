//
//  Xib+Helper.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Default Implementation for Identifier
extension UIView: Identifier {
    
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
}

