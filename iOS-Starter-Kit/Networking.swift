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
        
        // Repo request
        let repoRequest = FetchRepoRequest(param: ["q": text])
        return repoRequest.toPromise()
    }

}
