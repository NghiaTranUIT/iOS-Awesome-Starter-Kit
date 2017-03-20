//
//  UserObj.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import ObjectMapper

class UserObj: BaseObj {
    
    //
    // MARK: - Variable
    var name: String?
    var username: String?
    var email: String?
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        name <- map[Constants.Obj.User.Name]
        email <- map[Constants.Obj.User.Email]
        username <- map[Constants.Obj.User.Username]
    }
}
