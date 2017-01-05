//
//  RepoInteractor.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import PromiseKit


//
// MARK: - OUTPUT
protocol RepoInteractorOutput {
    
    
    /// Show Error
    func presentError(_ error: Error)
}


//
// MARK: - RepoInteractor
class RepoInteractor {

    
    //
    // MARK: - Variable
    
    /// Output
    var output: RepoInteractorOutput?
    
    
    /// Workers
    fileprivate lazy var fetchRepoWorker: FetchRepoWorker = {
       return FetchRepoWorker()
    }()
}


//
// MARK: - Controller's output
extension RepoInteractor: RepoControllerOutput {
    
    
    /// Fetch
    func fetchList() {
        
        /// Get worker
        self.fetchRepoWorker.execute()
            .then { _ -> Void in
                // Nothing
            }
            .catch { error in
                self.output?.presentError(error)
        }
    }
}
