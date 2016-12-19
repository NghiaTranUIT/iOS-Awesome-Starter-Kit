//
//  QueueManager.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import RxSwift

class QueueManager {
    
    
    /// Share instance
    static let shared = QueueManager()
    
    
    /// Main queue
    lazy var mainQueue: MainScheduler = {
       return MainScheduler.instance
    }()
    
    
    /// Background Queue
    lazy var backgroundQueue: ConcurrentDispatchQueueScheduler = {
        return ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background)
    }()
}
