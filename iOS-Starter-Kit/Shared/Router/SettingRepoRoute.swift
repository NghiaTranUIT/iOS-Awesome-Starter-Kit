//
//  SettingRepoRoute.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import Foundation
import UIKit

class SettingRouter: Router {
    
    typealias Element = SettingViewController
    
    var routerType: RouterType {
        return .push
    }
    
    fileprivate lazy var _viewController: SettingViewController = {
        return SettingViewController.xibInstance()
    }()
    
    var viewController: SettingViewController {
        return self._viewController
    }
}
