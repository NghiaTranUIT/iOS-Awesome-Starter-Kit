//
//  GetListConnectionRequest.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Alamofire
import ObjectMapper


class FetchRepoRequest {
    required init() {}
}


//
// MARK: - Network
extension FetchRepoRequest: Request {
    
    typealias T = [RepoObj]
    
    var httpMethod: HTTPMethod {
        get { return .get }
    }
    
    var endpoint: String {
        get { return Constants.APIEndPoint.RepoList }
    }
    
    var parameterEncoding: ParameterEncoding {
        get { return URLEncoding.default }
    }
    
    func decode(data: Any) -> Array<RepoObj> {
        return Mapper<RepoObj>().mapArray(JSONObject: data) ?? []
    }
}

