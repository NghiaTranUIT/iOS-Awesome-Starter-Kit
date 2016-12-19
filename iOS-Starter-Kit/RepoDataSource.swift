//
//  RepoDataSource.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/19/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


class RepoDataSource: NSObject {
    
    fileprivate var repos: Variable<[RepoObj]> {
        return mainStore.state.repoState!.repos
    }
    
}

//
// MARK: - TableView
extension RepoDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        
        let repo = self.repos.value[indexPath.row]
        cell.configureCellWithRepo(repo: repo)
        
        return cell
    }
}

extension RepoController: UITableViewDelegate {
    
}
