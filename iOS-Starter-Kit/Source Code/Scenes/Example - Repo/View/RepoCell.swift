//
//  RepoCell.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/16/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    // MARK: - Public
    func configureCellWithRepo(repo: RepoObj) {
        
        // Name
        self.textLabel?.text = repo.name
    }
}
