//
//  RepoConfiguration.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

class RepoConfiguration {

    static let shared = RepoConfiguration()
    
    func configure(viewController: RepoController) {
        
        // Presenter
        let presenter = RepoPresenter()
        presenter.output = viewController
        
        // Interactor
        let interactor = RepoInteractor()
        interactor.output = presenter
        
        // View controller
        viewController.output = interactor
        viewController.dataSource = presenter
    }
}
