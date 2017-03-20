//
//  SettingViewController.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import UIKit

protocol SettingViewControllerOutput {
    
}

class SettingViewController: UIViewController {

    //
    // MARK: - Variable
    var output: SettingViewControllerOutput?
    var searchText: String!
    
    
    //
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
// MARK: - XibInitialization
extension SettingViewController: XibInitialization {
    typealias Element = SettingViewController
}

//
// MARK: - SettingPresenterOutput
extension SettingViewController: SettingPresenterOutput {}
