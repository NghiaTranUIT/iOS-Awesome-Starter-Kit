//
//  SlackReport.swift
//  Titan
//
//  Created by Nghia Tran on 10/12/16.
//  Copyright © 2016 fe. All rights reserved.
//

import Foundation
import Alamofire

enum SlackReporterDataType {
    case Error
    case Response
}

struct SlackReporterData {
    
    let type: SlackReporterDataType
    
    // Slack
    private lazy var usernameSlack: String = {
        switch self.type {
        case .Error:
            return "Susu"
        case .Response:
            return "Rolex"
        }
    }()
    
    private lazy var icon_emoji: String = {
        switch self.type {
        case .Error:
            return ":dog:"
        case .Response:
            return ":stopwatch:"
        }
    }()
    
    // Data
    private var error: NSError?
    private var responseTime: CGFloat? = 0
    private var apiName: String = ""
    private var fileName: String = ""
    private var functionName: String = ""
    private var line: String = ""
    private var additionInfo: String = ""
    private lazy var buildNumber: String? = {
        guard let appInfo = Bundle.main.infoDictionary else {return nil}
        let appVersion = appInfo[kCFBundleVersionKey as String] as? String
        return appVersion
    }()
    
    init(error: NSError?, fileName: String, functionName: String, line: Int) {
        self.type = .Error
        self.error = error
        self.functionName = functionName
        self.line = String(line)
        
        // Filename
        let componment = fileName.components(separatedBy: "/")
        if let _fileName = componment.last {
            self.fileName = _fileName
        }
        else {
            self.fileName = "Unknow"
        }
    }
    
    init(responseTime: CGFloat?, apiName: String, response: Alamofire.DataResponse<AnyObject>?) {
        self.type = .Response
        self.responseTime = responseTime ?? 0
        self.apiName = apiName
        self.additionInfo = self.infoTextFromResponse(response: response)
    }
    
    mutating func toParam() -> [String: String] {
        let text = self.toLog()
        let username = self.usernameSlack
        let icon = self.icon_emoji
        
        let param: [String: String] = ["username": username,
                                       "icon_emoji": icon,
                                       "text": text]
        return param
    }
    
    private func infoTextFromResponse(response: Alamofire.DataResponse<AnyObject>?) -> String {
        guard let response = response else {return ""}
        
        var text: String = ""
        if let URL = response.request?.url?.absoluteString {
            text += " *URL* = \(URL)"
        }
        
        return text
    }
    
    private mutating func toLog() -> String {
        
        // Current User first
        var text: String = ""
        text += ":dark_sunglasses: "
        
        // Build version
        if let buildVersion = self.buildNumber {
            text += " :macOS: \(buildVersion)"
        }
        
        // Info
        switch self.type {
        case .Error:
            text += ":round_pushpin:\(fileName):\(line) :mag_right:\(functionName)"
            if let error = self.error {
                text += " 👉 \(error.localizedDescription)"
            }
            else {
                text += " 👉 Unknow"
            }
            return text
        case .Response:
            text += ":round_pushpin:\(self.apiName):"
            if let responseTime = self.responseTime {
                text += " 👉 \(responseTime)"
            }
            else {
                text += " 👉 Unknow"
            }
            text += " :rocket: \(self.additionInfo)"
            
            return text
        }
        
    }
}

class SlackReporter: NSObject {
    
    // MARK:
    // MARK: Variable
    private let Token = Constants.Logger.Slack.Token
    private let ErrorChannel = Constants.Logger.Slack.ErrorChannel
    private let ResponseChannel = Constants.Logger.Slack.ResponseChannel
    private lazy var URLErrorChannel: String = {
        return Constants.Logger.Slack.ErrorChannel_Webhook
    }()
    private lazy var URLResponseChannel: String = {
        return Constants.Logger.Slack.ResponseChannel_Webhook
    }()
    
    // MARK:
    // MARK: Public
    func reportErrorData(_ data: SlackReporterData) {
        
        // Build param
        var data = data
        let param = data.toParam()
        
        Alamofire.request(self.URLErrorChannel, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { (_) in
            
        }
    }
    
    func reportResponseData(data: SlackReporterData) {
        
        // Build param
        var data = data
        let param = data.toParam()
        
        Alamofire.request(self.self.URLResponseChannel, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { (_) in
            
        }
    }
    
    // MARK:
    // MARK: Private
    static let shareInstance = SlackReporter()
}

extension SlackReporter {
    
    // Test
    func testSlackReport() {
        let error = NSError.errorWithMessage(message: "Hi, I'm from Error Report")
        let data = SlackReporterData(error: error, fileName: #file, functionName: #function, line:#line)
        self.reportErrorData(data)
    }
    
    // Test
    func testSlackResponseReport() {
        let data = SlackReporterData(responseTime: 0.2, apiName: "TestAPIName", response: nil)
        self.reportResponseData(data: data)
    }
}
