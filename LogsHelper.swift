//
//  LogsHelper.swift
//
//  Created by Manikandan T.
//

import Foundation

class LogsHelper: NSObject {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()
    
    class func info(_ message: Any, event: LogType = .d, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        #if DEBUG
        print("\(formattedDate()) [\(event.rawValue)] [\(sourceFileName(filePath: fileName)):\(line) \(funcName)] -> \(message)")
        #endif
    }
    
    class func printLogs(_ items: Any..., type: LogType = .d, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        #if DEBUG
        print("---[\(formattedDate())] [\(type.rawValue)] [\(sourceFileName(filePath: fileName)):\(line) \(funcName)]---")
        for item in items {
            print(item)
        }
        print(String(repeating: "-", count: 66))
        #endif
    }
    
    private class func formattedDate() -> String {
        return dateFormatter.string(from: Date())
    }
    
    private class func sourceFileName(filePath: String) -> String {
        return (filePath as NSString).lastPathComponent
    }
}

enum LogType: String {
    case e = "[🚑]" // error
    case i = "[ℹ️]" // info
    case d = "[🔨]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}
