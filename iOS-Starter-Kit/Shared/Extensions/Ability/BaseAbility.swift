//
//  BaseViewAbility.swift
//  Titan
//
//  Created by Nghia Tran on 12/8/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation


//
// MARK: - BaseAbility
/// I don't prefer to way to subclass BaseClass
/// So BaseAbility will contain all things BaseClass does, but it's flexible
/// We don't need create BaseView, BaseCollectionViewCell, Base .....
/// Just conform this protocol
 protocol BaseAbility: class {
    
    
    /// Init all relative methods below
    /// An helper method
    func initBaseAbility()
    
    
    /// Init Common
    /// Intent to do everything common here
    func initCommon()
    
    
    /// UIs
    /// To do all things about UIs
    func initUIs()
    
    
    /// Binding
    func initBinding()
    
    
    /// Action
    func initActions()
}


//
// MARK: - Default Extension
/*
 The reason we why can't override ViewController's ViewDidLoad in extenstion, 'cause Swift protocol don't allow we do that
 So we need create seperate method to call it manaully
 */
extension BaseAbility {
    
    
    /// Make default implement of initBaseAbility to call all relative methods.
    /// We must call method in where we need. Ex: ViewController's ViewDidLoad
    /// NSView's AwakeFromNib
    func initBaseAbility() {
        
        self.initCommon()
        
        self.initUIs()
        
        self.initBinding()
        
        self.initActions()
    }
}


