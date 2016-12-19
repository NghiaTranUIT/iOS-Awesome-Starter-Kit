//
//  Constants.swift
//  feels
//
//  Created by Nghia Tran Vinh on 5/24/16.
//  Copyright © 2016 fe. All rights reserved.
//

import UIKit

struct Constants {
    
    
    // APPLICATION
    struct App {
        
        
        // Main
        static let isDebugJSON = true
        static let isHTTPS = false
        
        
        // Base
        static let BaseURL: String = {
            if Constants.App.isHTTPS {
                return "https://"
            }
            else {
                return "http://"
            }
        }()
        
        
        // Key
        struct Key {
            
            // Key Chain
            struct KeyChain {
                
            }
            
            // Twitter
            struct Twitter {
                
            }
            
            // Instagram
            struct Instagram {
                
            }
            
            // S3 amazon
            struct S3Amazon {
                
            }
            
            // Youtube
            struct Youtube {
                
            }
        }
        
        #if DEBUG // -> Development

            static let BaseFeelsAPIURL = "your.base.endpoint.development"

        #else // -> Production
        
            static let BaseFeelsAPIURL = "your.base.endpoint.production"
        
        #endif
    
    }
    
    
    // MARK:
    // MARK: Feels
    struct APIEndPoint {
        
        static let RepoList = ""
        
    }
    
    
    // MARK:
    // MARK: KeyAPI
    struct APIKey {
        
    }
    
    
    // MARK:
    // MARK: Feels Object
    struct Obj {
        
        
        // MARK:
        // MARK: BASE
        static let CreatedAt = "created_at"
        static let UpdatedAt = "updated_at"
        static let ObjectId = "id"
        
        
        // MARK:
        // MARK: USER
        struct User {
            static let Name = "name"
            static let Username = "username"
            static let Email = "email"
        }
    }
    
    
    // Slack Report
    struct Slack {
        
        // Base
        static let Token = "your.token.slack"
        static let ErrorChannel = "name.error.slack.channel"
        static let ResponseChannel = "name.response.slack.channel"
        
        
        // Webhook integration
        static let ErrorChannel_Webhook = "webhook.error.channel"
        static let ResponseChannel_Webhook = "webhook.response.channel"
    }
}
