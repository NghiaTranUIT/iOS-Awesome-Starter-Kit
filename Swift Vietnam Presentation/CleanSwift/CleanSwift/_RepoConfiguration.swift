//
//  _RepoConfiguration.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

class _RepoConfiguration: NSObject {

    static let shared = _RepoConfiguration()
    
    func configure(viewController: _RepoController) {
        
        // Presenter
        let presenter = _RepoPresenter()
        presenter.output = viewController
        
        // Interactor
        let interactor = _NewRepoInteractor()
        interactor.output = presenter
        
        // View controller
        viewController.output = interactor
//        viewController.dataSource = presenter
    }
    
}
