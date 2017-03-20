//
//  SettingConfiguration.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import UIKit

class SettingConfiguration {

    static let shared = SettingConfiguration()
    
    func configure(viewController: SettingViewController) {
        
        // Presenter
        let presenter = SettingPresenter()
        presenter.output = viewController
        
        // Interactor
        let interactor = SettingInteractor()
        interactor.output = presenter
        
        // View controller
        viewController.output = interactor
    }
    
}
