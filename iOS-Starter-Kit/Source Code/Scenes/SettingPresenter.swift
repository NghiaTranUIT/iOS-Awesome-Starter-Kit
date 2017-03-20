//
//  SettingPresenter.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import UIKit

protocol SettingPresenterOutput: class {
    
}

//
// MARK: - SettingPresenter
class SettingPresenter: NSObject {

    //
    // MARK: - Variable
    weak var output: SettingPresenterOutput?
}

//
// MARK: - SettingInteractorOutput
extension SettingPresenter: SettingInteractorOutput {}
