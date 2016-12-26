//
//  NSCollectionView+Register.swift
//  Titan
//
//  Created by Nghia Tran on 12/2/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Register View
extension UICollectionView {
    
    
    /// Helper register cell
    /// The View must conform Identifier protocol
    func registerCell<T: Identifier>(_ viewType: T.Type) {
        self.register(viewType.xib(), forCellWithReuseIdentifier: viewType.identifierView)
    }
    
    
    /// Register Supplementary
    func registerSupplementary<T: Identifier>(_ supplementaryType: T.Type, kind: String) {
        self.register(supplementaryType.xib(), forSupplementaryViewOfKind: kind, withReuseIdentifier: supplementaryType.identifierView)
    }
}
