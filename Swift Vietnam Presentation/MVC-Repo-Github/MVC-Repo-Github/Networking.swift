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

typealias NetworkCompletionBlock = (NetworkResult<Any>)->()

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
    func fetchRepoWithText(text: String, completion: NetworkCompletionBlock?) {
        
        // Encoding
        let escapedQuery = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        // url
        let url = URL(string: "https://api.github.com/search/repositories?q=\(escapedQuery)")!
        
        // Query
        Alamofire.request(url)
        .validate()
        .responseJSON { (response) in
            
            let result = response.result
            
            switch result {
            case .success(let value):
                
                // Parse
                let repoObjs = Mapper<RepoObj>().mapArray(JSONObject: value) ?? []
                
                // Complete
                completion?(NetworkResult.success(repoObjs))
                
            case .failure(let error):
                completion?(NetworkResult.failed(error))
            }
        }
    }
    
    
    // Fetch current user
    func fetchCurrentUser() {
        
        // Fetch current user
        let urlCurrentUser = URL(string: "/user")!
        Alamofire.request(urlCurrentUser)
        .validate()
        .responseJSON { (response) in
            
            // Check
            switch response.result {
            case .success:
                
                // Check
                switch response.result {
                case .success:
                    
                    // Fetch Setting
                    let urlSetting = URL(string: "/setting")!
                    Alamofire.request(urlSetting)
                        .validate()
                        .responseJSON(completionHandler: { (response) in
                            
                            // Fetch notification
                            let urlNotification = URL(string: "/notification")!
                            Alamofire.request(urlNotification)
                                .validate()
                                .responseJSON(completionHandler: { (response) in
                                    
                                    // Fetch more here
                                    // -> 😡 Too much call-back
                                    
                                })
                        })
                case .failure(let error):
                    
                    // Handle error
                    print("fail \(error)") // -> 😡 Duplicated
                    break
                }
                
            case .failure(let error):
                
                // Handle error
                print("fail \(error)") // -> 😡 Duplicated
                break
            }
        }
    }
}
