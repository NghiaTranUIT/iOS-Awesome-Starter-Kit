//
//  RepoViewController.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/16/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {

    //
    // MARK: - Variable
    fileprivate var repos: [RepoObj] = []
    
    //
    // MARK: - OUTLET
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        self.initCommon()
        self.initTableView()
        
        // Load data
        self.fetchData()
        self.fetchUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - Private
    private func initCommon() {
        
    }
    
    private func initTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
    }
    
    private func fetchData() {
        
        guard let text = self.searchBar.text else {return}
        
        // Fetch
        Networking.shared.fetchRepoWithText(text: text) { (result) in
            
            // Handle here
            switch result {
            case .success(let repos):
                
                // Update
                self.repos = repos as! [RepoObj]
                self.tableView.reloadData()
            case .failed(let error):
                
                // Show error
                print(error)
                break
            }
        }
    }
    
    private func fetchUserInfo() {
        
        // Fetch Current User
        Networking.shared.fetchCurrentUser()
        
        // Fetch Setting
        Networking.shared.fetchSetting
        
        // Fetch ...
    }
}


//
// MARK: - TableView
extension RepoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        
        let repo = self.repos[indexPath.row]
        cell.configureCellWithRepo(repo: repo)
        
        return cell
    }
}

extension RepoViewController: UITableViewDelegate {
    
}
