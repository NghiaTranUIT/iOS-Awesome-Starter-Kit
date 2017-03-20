//
//  NSTableView.swift
//  Titan
//
//  Created by Nghia Tran on 11/13/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import UIKit


//
// MARK: - Register View
extension UITableView {
    
    
    /// Helper register cell
    /// The View must conform Identifier protocol
    func registerCell<T: XibInitialization>(_ viewType: T.Type) {
        self.register(viewType.xib(), forCellReuseIdentifier: viewType.identifier)
    }
}
