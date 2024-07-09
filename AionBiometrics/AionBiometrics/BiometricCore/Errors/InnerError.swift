//
//  InnerError.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 04/07/2024.
//

import Foundation

public protocol InnerError: Error {
    
    var code: ErrorCode { get }
    var errorDetail: String? { get }
    var message: String? { get }
    var rawCode: Int { get }
    var description: String { get }
    
    func isType(of: ErrorType) -> Bool
    func isSame(with: ErrorCode) -> Bool
}
