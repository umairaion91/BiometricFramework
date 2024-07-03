//
//  DocumentOriginType.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import Foundation
import DaonDocument

public enum DocumentSide {
    case front
    case back
}

public enum DocumentOrigin {
    case bahrain(DocumentSide)
    case kuwait(DocumentSide)
    case uae(DocumentSide)
    case saudi(DocumentSide)
    case oman(DocumentSide)
    case none
}

extension DocumentOrigin {
    
    var scan: NSMutableSet {
        switch self {
        case .bahrain(let side):
            return side == .front ? NSMutableSet(array: [kIdDocument]) : NSMutableSet(array: [kIdDocument])
        case .kuwait(let side):
            return side == .front ? NSMutableSet(array: [kKuwaitFrontID]) : NSMutableSet(array: [kKuwaitBackID])
        case .uae(let side):
            return side == .front ? NSMutableSet(array: [kUnitedArabEmiratesFrontID]) :  NSMutableSet(array: [kUnitedArabEmiratesBackID])
        case .saudi(let side):
            return side == .front ? NSMutableSet(array: [kIdDocument]) : NSMutableSet(array: [kIdDocument])
        case .oman(let side):
            return side == .front ? NSMutableSet(array: [kIdDocument]) : NSMutableSet(array: [kIdDocument])
        case .none:
            return NSMutableSet(array: [kIdDocument])
        }
    }
}
