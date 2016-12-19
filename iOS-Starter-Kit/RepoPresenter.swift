//
//  RepoPresenter.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

protocol RepoPresenterOutput: class {
    
    /// Error
    func presentError(_ error: Error)
    
    
    /// Reload data
    func reloadData(repos: [RepoObj])
}

class RepoPresenter {

    
    //
    // MARK: - Variable
    
    /// Output
    weak var output: RepoPresenterOutput?
}


extension RepoPresenter: RepoInteractorOutput {
    
    func presentError(_ error: Error) {
        self.output?.presentError(error)
    }
}

//
// MARK: - Data Source
extension RepoPresenter: RepoControllerDataSource {
    
    func numberOfRepo() -> Int {
        return 0
    }
    
    func repoAtRow(row: Int) -> RepoObj {
    
    }
}
