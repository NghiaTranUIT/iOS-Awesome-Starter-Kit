//
//  SettingInteractor.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import UIKit

protocol SettingInteractorOutput {
    
}

//
// MARK: - SettingInteractor
class SettingInteractor {
    
    //
    // MARK: - Variable
    var output: SettingInteractorOutput?
}

//
// MARK: - SettingViewControllerOutput
extension SettingInteractor: SettingViewControllerOutput {}
