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
    
    func numberOfRepo() -> Int
    func repoAtRow(row: Int) -> RepoObj
}

//
// MARK: - Repo
class RepoController: UIViewController {

    //
    // MARK: - Output
    var output: RepoControllerOutput?
    weak var input: RepoPresenterOutput?
    weak var dataSource: RepoControllerDataSource!
    
    //
    // MARK: - OUTLET
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch
        self.output?.fetchList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension RepoController: RepoPresenterOutput {
    
    func presentError(_ error: Error) {
        
        /// Show error view
    }
    
    
    func reloadData(repos: [RepoObj]) {
        self.tableView.reloadData()
    }
}


//
// MARK: - TableView
extension RepoController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.numberOfRepo()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        
        let repo = self.dataSource.repoAtRow(row: indexPath.row)
        cell.configureCellWithRepo(repo: repo)
        
        return cell
    }
}

extension RepoController: UITableViewDelegate {
    
}
