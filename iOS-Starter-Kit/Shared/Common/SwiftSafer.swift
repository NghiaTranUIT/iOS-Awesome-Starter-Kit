//
//  SwiftSafer.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import Foundation

typealias SafeAccessBlock = () -> ()

// Protocol
protocol Safe {
    
    func read(_ accessBlock: SafeAccessBlock)
    
    func writeSync(_ accessBlock: SafeAccessBlock)
    
    func writeAync(_ accessBlock: @escaping SafeAccessBlock)
}

let EREWQueueName = "com.fe.feels.EREW"
let CREWQueueName = "com.fe.feels.CREW"

class EREW: Safe {
    
    var queue: DispatchQueue!
    
    init(queue: DispatchQueue = DispatchQueue(label: EREWQueueName, attributes: [])) {
        self.queue = queue
    }
    
    func read(_ accessBlock: SafeAccessBlock) {
        self.queue.sync(execute: accessBlock)
    }
    
    internal func writeAync(_ accessBlock: @escaping () -> ()) {
        self.queue.async(execute: accessBlock)
    }
    
    func writeSync(_ accessBlock: SafeAccessBlock) {
        self.queue.sync(execute: accessBlock)
    }
}

class CREW: Safe {
    
    var queue: DispatchQueue!
    
    init(queue: DispatchQueue = DispatchQueue(label: CREWQueueName, attributes: DispatchQueue.Attributes.concurrent)) {
        self.queue = queue
    }
    
    func read(_ accessBlock: SafeAccessBlock) {
        self.queue.sync(execute: accessBlock)
    }
    
    internal func writeAync(_ accessBlock: @escaping () -> ()) {
        self.queue.async(flags: .barrier, execute: accessBlock)
    }
    
    func writeSync(_ accessBlock: SafeAccessBlock) {
        self.queue.sync(flags: .barrier, execute: accessBlock)
    }
}
