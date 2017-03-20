//
//  RepoObj.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/16/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoObj: BaseObj {
    
    //
    // MARK: - Variable
    var name: String?
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        name <- map[Constants.Obj.Repo.Name]
    }
}
