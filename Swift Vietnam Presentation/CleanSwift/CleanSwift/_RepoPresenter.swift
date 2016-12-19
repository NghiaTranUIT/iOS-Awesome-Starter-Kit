//
//  _RepoPresenter.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

protocol _RepoPresenterOutput: class {
    
    func showAlerView()
}

class _RepoPresenter: NSObject {

    weak var output: _RepoPresenterOutput?
}

extension _RepoPresenter: _RepoInteractorOutput {
    
    func showError() {
        
    }
}
 
