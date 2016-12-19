//
//  BaseViewController.swift
//  Titan
//
//  Created by Nghia Tran on 10/11/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import UIKit

//
// MARK: - Confrom BaseAbility
/// The main purpose is we don't perfer BaseViewController
/// If create BaseViewController, we also need to create BaseSplitViewController, BaseNavigationController 
/// -> Redundancy code


/*
 # Tried 1
 
 - Extension default implement for all BaseAbility's methods
 -> Problem: Subclass of NSViewController can't override method from protocol
 
 
 # Tried 2
 
 - Convert it's to optional
 - So we don't need to implement BaseAbility's protocol
 -> Problem: optional only support in @objs protocl, and @objc method.
 But the real struggle is, @objc protocol doesn't support Extension Protocol =,=
 Ref: http://stackoverflow.com/questions/39487168/non-objc-method-does-not-satisfy-optional-requirement-of-objc-protocol
 
 # Tried 3
 - Conform BaseAbility protocol
 - Implement default methods
 -> Results: 'Override method' worked
 'Don't need BaseView, BaseCollectionView, Base ....'
 
 */

extension UIViewController: BaseAbility {

    
    /// Common
    func initCommon() {
        
    }
    
    /// Appearance
    func initUIs() {}
    
    
    /// Binding
    func initBinding() {}
    
    
    /// Action
    func initActions() {}
    
}
