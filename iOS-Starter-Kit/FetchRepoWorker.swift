//
//  FetchRepoWorker.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import ReSwift
import PromiseKit

//
// MARK: - Action
struct UpdateRepoListAction: Action {
    
    var repos: [RepoObj]?
}


//
// MARK: - FetchRepoWorker
class FetchRepoWorker: AsyncWorker {

    typealias T = [RepoObj]
    
    func execute() -> Promise<T> {
        
        // Return
        return Networking.shared.fetchRepoWithText(text: "titan")
        .then { (repoObjs) -> Promise<T> in
            
            // Disaptch action
            let action = UpdateRepoListAction(repos: repoObjs)
            mainStore.dispatch(action)
            
            return Promise(value: repoObjs)
        }
    }
}
