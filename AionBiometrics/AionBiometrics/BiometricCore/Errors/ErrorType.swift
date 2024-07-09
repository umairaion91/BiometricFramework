//
//  ErrorType.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 05/07/2024.
//

import Foundation

public enum ErrorType: String, Encodable {
   
    case Authentication
    case Configuration
    
    case DocumentScanService
    case FaceScanService
    
    case Unknown
}
