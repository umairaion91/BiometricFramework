//
//  InternalErrors.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 05/07/2024.
//

import Foundation

public enum ErrorCodeInternal: Int, ErrorCode {
    
    public var type: ErrorType {
        switch self.rawValue {
        case 0..<100:
            return .Authentication
        case 100..<200:
            return .Configuration
        case 200..<300:
            return .DocumentScanService
        case 300..<400:
            return .FaceScanService
        default:
            return .Unknown
        }
    }
    
    //MARK: - Configuration Error Code
    case MissingConfig = 100
    case ParsingConfig = 101
    case WritingConfig = 102
    case LocalizationConfig = 103
    
    //MARK: - Unknown Error Code
    case Unkown = 1000
    
    
    public func create(_ details: String = "") {
        
    }
    
    internal func create(error: NSError) {
        
    }
    
}
