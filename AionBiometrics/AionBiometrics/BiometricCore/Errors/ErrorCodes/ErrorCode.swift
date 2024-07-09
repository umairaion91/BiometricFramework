//
//  ErrorCode.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 05/07/2024.
//

import Foundation

public protocol ErrorCode: Error {
    
    var rawValue: Int { get }
    var readable: String { get }
    var type: ErrorType { get }
    
    typealias Internal = ErrorCodeInternal
}

extension ErrorCode {
    public var readable: String {
        return String(String(reflecting: self).split(separator: ".").last!)
    }
}

func ==(lhs: ErrorCode, rhs: ErrorCode) -> Bool {
    return (lhs.type == rhs.type) && (lhs.rawValue == rhs.rawValue)
}

