//
//  Error+Default.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/19/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation


extension NSError {
    
    /// Unknow error
    static func unknowError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: "Unknow error"]
        return NSError(domain: "com.fe.defaultError", code: 999, userInfo: userInfo)
    }
    
    
    /// JSON Mapper Error
    static func jsonMapperError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: "JSON Mapper error"]
        return NSError(domain: "com.fe.defaultError", code: 998, userInfo: userInfo)
    }
}
