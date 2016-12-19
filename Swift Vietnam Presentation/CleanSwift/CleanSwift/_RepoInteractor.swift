//
//  _RepoInteractor.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

protocol _RepoInteractorOutput {
    
    func showError()
}


class _RepoInteractor {

    var output: _RepoInteractorOutput?
    let fetchRepoWorker = FetchRepoWorker()
}


extension _RepoInteractor: _RepoControllerOutput {
    
    func fetchRepo() {
        
        self.fetchRepoWorker.execute()
            .then { _ -> Void in
                // Nothing
            }
            .catch { error in
                self.output?.presentError(error)
    }
}
