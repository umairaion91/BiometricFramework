//
//  BiometricError.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 05/07/2024.
//

import Foundation

public class BiometricError: InnerError {
    
    public var code: ErrorCode
    public var errorDetail: String?
    public var message: String?
    public var rawCode: Int = -1
    
    public var description: String {
        return "ErrorCode: \(code) | Domain: \(code.type) | Message: \(message ?? "") | Details: \(errorDetail ?? "")"
    }
    
    public init(code: ErrorCode, message: String, details: String) {
        self.code = code
        self.errorDetail = details
        self.message = message
    }
    
    
    public func isType(of: ErrorType) -> Bool {
        return true
    }
    
    public func isSame(with: any ErrorCode) -> Bool {
        return true
    }
    
    
}
