//
//  RepoPresenter.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import RxSwift

protocol RepoPresenterOutput: class {
    
    /// Error
    func presentError(_ error: Error)
    
    
    /// Reload data
    func reloadData(repos: [RepoObj])
}

class RepoPresenter {

    
    //
    // MARK: - Variable
    fileprivate var repos: Variable<[RepoObj]> {
        return mainStore.state.repoState!.repos
    }
    
    
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
    
    func repoDataSource() -> UITableViewDataSource {
        return RepoDataSource()
    }
}
