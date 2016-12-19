//
//  SettingState.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import ReSwift


//
// MARK: - Setting State
struct SettingState: StateType {

}


//
// MARK: - Reducer
extension SettingState {
    static func reducer(action: Action, state: SettingState?) -> SettingState {
        
        // Get state
        var state = state ?? SettingState()
        
        // Doing
        switch action {
        default:
            break
        }
        
        // Return
        return state
    }
}
