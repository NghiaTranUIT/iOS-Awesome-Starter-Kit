//
//  BaseObj.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/19/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import ObjectMapper


class BaseObj: Mappable {
    
    
    //
    // MARK: - Variable
    var objectId: String!
    var createdAt: Date!
    var updatedAt: Date!
    var className: String!
    
    
    //
    // MARK: - Init
    required init?(map: Map) {
        
        guard map.JSON[Constants.Obj.ObjectId] != nil else {
            Logger.error("Can't create obj in BaseObj. Missing ObjectId")
            return nil
        }
    }
    
    
    /// Mapping function
    func mapping(map: Map) {
        self.objectId <- map[Constants.Obj.ObjectId]
        self.createdAt <- (map[Constants.Obj.CreatedAt], APIDateTransform())
        self.updatedAt <- (map[Constants.Obj.UpdatedAt], APIDateTransform())
    }
}


//
// MARK: - Date Transform
public class APIDateTransform: TransformType {
    
    public typealias Object = Date
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJSON(_ value: Any?) -> Date? {
        if let value = value as? String {
            return ApplicationManager.sharedInstance.globalDateFormatter.date(from: value) as Date?
        }
        
        if let value = value as? Date {
            return value
        }
        
        return nil
    }
    
    public func transformToJSON(_ value: Date?) -> String? {
        if let value = value {
            return ApplicationManager.sharedInstance.globalDateFormatter.string(from: value as Date)
        }
        
        return nil
    }
}
