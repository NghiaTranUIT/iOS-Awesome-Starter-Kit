//
//  RepoState.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import ReSwift

//
// MARK: - Repo
struct RepoState: StateType {

    
    /// Repos list
    var repos: [RepoObj] = []
}


//
// MARK: - Reducer
extension RepoState {
    static func reducer(action: Action, state: RepoState?) -> RepoState {
        
        // Get state
        var state = state ?? RepoState()
        
        // Doing
        switch action {
        case let action as UpdateRepoListAction:
            
            /// Update here
            state.repos = action.repos ?? []
            
            break
        default:
            break
        }
        
        return state
    }
}

