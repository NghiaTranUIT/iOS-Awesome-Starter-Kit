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
// MARK: - Identifier
// Easily to get ViewID and XIB file
protocol Identifier {
    
    
    /// ID view
    static var identifierView: String {get}
    
    
    /// XIB - init XIB from identifierView
    static func xib() -> UINib?
}
