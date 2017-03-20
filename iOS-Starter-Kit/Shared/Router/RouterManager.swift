//
//  RouterManager.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/21/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import UIKit

class RouterManager {
    
    //
    // MARK: - Variable
    static let shared = RouterManager()
    
    //
    // MARK: - Initialize
    init() {
        
    }
    
    //
    // MARK: - helper
    var rootViewController: UIViewController? {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.window?.rootViewController
    }
    
    var visibleNavigationController: UINavigationController? {
        return self.visibleViewController?.navigationController
    }
    
    var visibleViewController: UIViewController? {
        guard let rootViewController = self.rootViewController else {return nil}
        
        // Present
        if let presentedVC = rootViewController.presentedViewController {
            return presentedVC
        }
        
        // Navi
        if let navi = rootViewController as? UINavigationController {
            return navi.visibleViewController
        }
        
        return rootViewController
    }
    
    func handleRouter<A: Router>(_ router: A) {
        
        // Get view controller
        let viewController = router.viewController
        
        // Handle
        switch router.routerType {
        case .root:
            let app = UIApplication.shared.delegate as! AppDelegate
            app.window = UIWindow(frame: UIScreen.main.bounds)
            app.window?.rootViewController = viewController
            app.window?.makeKeyAndVisible()
            
        case .push:
            self.visibleNavigationController?.pushViewController(viewController, animated: true)
            
        case .present:
            self.visibleViewController?.present(viewController, animated: true, completion: nil)
        }
    }
}
