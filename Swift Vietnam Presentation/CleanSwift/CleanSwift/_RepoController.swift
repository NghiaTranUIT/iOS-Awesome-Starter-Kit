//
//  _RepoController.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit


protocol _RepoControllerOutput {
    
    func fetchRepo()
}

class _RepoController: UIViewController {

    
    //
    // MARK: - OUTPUT
    var output: _RepoControllerOutput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.fetchRepo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchRepo() {
        
        // MaGIC
        self.output?.fetchRepo()
    }
}



extension _RepoController: _RepoPresenterOutput {
    
    func showAlerView() {
        // API
        // ALertView
    }
}
