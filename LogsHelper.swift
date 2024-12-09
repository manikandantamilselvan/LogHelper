//
//  LogsHelper.swift
//
//  Created by Manikandan T.
//

import Foundation

class LogsHelper: NSObject {
    
    
    class func info(_ message:Any,event: LogType = .d ,fileName: String = #file,line: Int = #line,column: Int = #column,funcName: String = #function) {
        #if DEBUG
        print("\(Date())[\(event.rawValue)][\(self.sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) -> \(message)")
        #endif
    }
    
    class func printLogs(_ items: Any..., type: LogType = .d, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        #if DEBUG
        print("---[\(Date()):-  [\(type.rawValue)] [\(self.sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName)]---")
        for item in items {
            print(item)
        }
        print(String(repeating: "-", count: 66))
        #endif
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
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
