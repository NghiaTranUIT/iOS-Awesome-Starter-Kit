//
//  Networking.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/16/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import PromiseKit

//
// MARK: - Result warpper
enum NetworkResult<T> {
    case success(T)
    case failed(Error)
}


//
// MARK: - Networking
class Networking {
    
    
    /// Singleton
    static let shared = Networking()
    
    
    /// Fetch Repo
    func fetchRepoWithText(text: String) -> Promise<[RepoObj]> {
        
        return Promise { fulfill, reject in
    

            // Query
            Alamofire.request(url)
                .validate()
                .responseJSON { (response) in
                    
                    let result = response.result
                    
                    switch result {
                    case .success(let value):
                        
                        // Parse
                        let repoObjs = Mapper<RepoObj>().mapArray(JSONObject: value) ?? []
                        
                        // Full fill
                        fulfill(repoObjs)
                        
                    case .failure(let error):
                        
                        // Reject
                        reject(error)
                    }
            }
        }
    }

}
