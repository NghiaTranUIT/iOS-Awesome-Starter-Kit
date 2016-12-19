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
    func reloadTableView()
}

class RepoPresenter {
    
    /// Data Source
    fileprivate lazy var repoDataSource: RepoDataSource = {
        let repo = RepoDataSource()
        repo.delegate = self
        return repo
    }()
    
    
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
    
    func dataSource() -> UITableViewDataSource {
        return self.repoDataSource
    }
}


//
// MARK: - Delegate
extension RepoPresenter: RepoDataSourceDelegate {
    
    func reloadTableView() {
        self.output?.reloadTableView()
    }
}
