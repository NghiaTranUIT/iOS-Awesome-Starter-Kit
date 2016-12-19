//
//  RepoController.swift
//  CleanSwift
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit


//
// MARK: - OUTPUT
protocol RepoControllerOutput {
    
    /// Fetch
    func fetchList()
}


//
// MARK: - DataSource
protocol RepoControllerDataSource: class {
    
    // Repo
    func dataSource() -> UITableViewDataSource
}

//
// MARK: - Repo
class RepoController: UIViewController {

    
    //
    // MARK: - Output
    var output: RepoControllerOutput?
    weak var input: RepoPresenterOutput?
    weak var dataSource: RepoControllerDataSource?
    
    
    //
    // MARK: - OUTLET
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    //
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Clean
        RepoConfiguration.shared.configure(viewController: self)
        
        // Init
        self.initBaseAbility()
        
        // Fetch
        self.output?.fetchList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initUIs() {
        self.tableView.registerCell(RepoCell.self)
        self.tableView.dataSource = self.dataSource?.dataSource()
    }
}


extension RepoController: RepoPresenterOutput {
    
    func presentError(_ error: Error) {
        
        /// Show error view
    }
    
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

