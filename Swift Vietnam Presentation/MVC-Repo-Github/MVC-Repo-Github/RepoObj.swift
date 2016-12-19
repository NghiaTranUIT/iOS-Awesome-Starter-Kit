//
//  RepoObj.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/16/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoObj: Mappable {
    
    //
    // MARK: - Variable
    var name: String?
    var createdAt: Date?
    
    //
    // MARK: - Mapping
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name         <- map["name"]
        createdAt    <- (map["createdAt"], DateTransform())
    }
}
