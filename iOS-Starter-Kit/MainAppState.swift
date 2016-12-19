//
//  MainAppState.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit
import ReSwift

struct MainAppState: StateType {
    
    //
    // MARK: - States
    
    /// Repo State
    let repoState: RepoState?
    
    
    /// Setting State
    let settingState: SettingState?
}
