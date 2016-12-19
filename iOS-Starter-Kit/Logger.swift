//
//  Logger.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import SwiftyBeaver

// MARK:
// MARK: Log Instace
class Log: NSObject {
    
    let log = SwiftyBeaver.self
    
    // Share instance
    static var shareInstance = Log()
    
    override init() {
        super.init()
        
        // Log console
        let console = ConsoleDestination()  // log to Xcode Console
        self.log.addDestination(console)
    }
    
    // MARK:
    // MARK: Public
    func error(_ error:Any, fileName: String, functionName: String, line: Int) {
        self.log.error(error, fileName, functionName, line: line)
    }
    
    func warning(_ warning:Any, _ file: String, _ function: String, _ line: Int) {
        self.log.warning(warning)
    }
    
    func debug(_ debug:Any, _ file: String, _ function: String, _ line: Int) {
        self.log.debug(debug)
    }
    
    func info(_ info:Any, _ file: String, _ function: String, _ line: Int) {
        self.log.info(info, file, function, line: line)
    }
    
    func verbose(_ verbose:Any, _ file: String, _ function: String, _ line: Int) {
        self.log.verbose(verbose)
    }
}


// MARK:
// MARK: Helper
class Logger {
    
    // Helper
    // MARK: Public
    class func initLogger() {
        _ = Log.shareInstance
    }
    
    class func error(_ error:Any, toSlack:Bool = true, fileName: String = #file, functionName: String = #function, line: Int = #line) {
        
        // Console
        Log.shareInstance.error(error, fileName: fileName, functionName: functionName, line: line)
        
        if toSlack {
            let errorObj = NSError.errorWithMessage(message: "\(error)")
            SlackReporter.shareInstance.reportErrorData(SlackReporterData(error: errorObj, fileName: fileName, functionName: functionName, line: line))
        }
    }
    
    class func warning(_ warning: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        Log.shareInstance.warning(warning, file, function, line)
    }
    
    class func debug(_ debug: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        Log.shareInstance.debug(debug, file, function, line)
    }
    
    class func info(_ info: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        Log.shareInstance.info(info, file, function, line)
    }
    
    class func verbose(_ verbose: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        Log.shareInstance.verbose(verbose, file, function, line)
    }
}


extension NSError {
    class func errorWithMessage(message: String) -> NSError {
        return NSError(domain: "com.fe.feels", code: 999, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
