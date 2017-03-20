//
//  DiskManager.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 3/20/17.
//  Copyright © 2017 nghiatran. All rights reserved.
//

import Foundation
import ObjectMapper

//
// MARK: - FileType
enum FileType: String {
    
    case userFile = "currentUser.feels"
    case installationFile = "currentInstallation.feels"
    
    func toFilePath() -> String {
        switch self {
        case .userFile:
            return DiskManager.shareInstance.pathForCurrentUserFile
        case .installationFile:
            return DiskManager.shareInstance.pathForInstallationFile
        }
    }
    
    static let allValue: [FileType] = [.userFile, .installationFile]
}

class DiskManager {
    
    // MARK:
    // MARK: Vairable
    fileprivate let safe = EREW()
    static let shareInstance = DiskManager()
    
    // MARK:
    // MARK: Private
    lazy var pathForCurrentUserFile: String = {return (self.pathForDocumentFolder as NSString).appendingPathComponent(FileType.userFile.rawValue)}()
    lazy var pathForInstallationFile: String = {return (self.pathForDocumentFolder as NSString).appendingPathComponent(FileType.installationFile.rawValue)}()
    
    fileprivate lazy var pathForDocumentFolder: String = {
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return path
    }()
    
    fileprivate lazy var urlForDocumentFolder: URL = {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url
    }()
    
    fileprivate lazy var pathForDirectioryFolder: String = {
        let path = FileManager.default.currentDirectoryPath
        return path
    }()
    
    
    // MARK:
    // MARK: Method
    fileprivate func saveToFile(_ object: BaseObj, type: FileType) {
        // Exclusive Write
        safe.writeSync {
            let dict = object.toJSON()
            
            // Try to cast JSON
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            guard let json = jsonData else {
                return
            }
            
            // Convert
            if let stringJSON = String(data: json, encoding: String.Encoding.utf8) {
                let path = type.toFilePath()
                _ = try? stringJSON.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
                path.removeICloudBackup()
            }
        }
    }
    
    fileprivate func loadModelFromFileWithType<N: Mappable>(_ type: FileType) -> N? {
        var map: N? = nil
        self.safe.read {
            
            // Get file path
            let filePath = type.toFilePath()
            guard FileManager.default.fileExists(atPath: filePath) else {return}
            guard let jsonString = try? String(contentsOfFile: filePath, encoding: String.Encoding.utf8) else {return}
            if let _map = Mapper<N>().map(JSONString: jsonString) {
                map = _map
            } else {
                self.unsafeDeleteAllFile()
            }

        }
        return map
    }
    
    func deleteAllFile() {
        
        // Safe if warp to sync queue
        self.safe.writeSync {
            self.unsafeDeleteAllFile()
        }
    }
    
    fileprivate func unsafeDeleteAllFile() {
        let fileManager = FileManager.default
        for fileType in FileType.allValue {
            let path = fileType.toFilePath()
            guard fileManager.fileExists(atPath: path) else {continue}
            do {
                let _ = try? fileManager.removeItem(atPath: path)
            }
        }
    }
}

// MARK:
// MARK: iCloud Logic
extension URL {
    func removeICloudBackup() {
        do {
            let _ = try (self as NSURL).setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
        }
        catch (let error) {
            Logger.error("Can't setResourceValue Image to path \(self), error = \(error)")
        }
    }
}

extension String {
    func removeICloudBackup() {
        do {
            guard let URL = URL(string: self) else {return}
            let _ = try (URL as NSURL).setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
        }
        catch (let error) {
            Logger.error("Can't setResourceValue Image to path \(self), error = \(error)")
        }
    }
}
