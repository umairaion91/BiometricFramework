//
//  DocumentScanTypes.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import Foundation

enum DocumentType {
    case EdgeDetection
    case EdgeDetectionA4Portrait
    case EdgeDetectionA4Landscape
    case EdgeDetectionA4
    case Passport
    case EUDL
    case USDL
    case AustralianDL
    case SerbianID
    case GermanID
    case AustrianID
    case SlovakID
    case SlovenianID
    case CzechID
    case CroatianID
    case SingaporeID
    case MalaysianID
    case PolishID
    case SouthAfricanGreenBook
    case ColumbianID
    case EmiratesID
}

extension DocumentType {
    
    var value: String {
        switch self {
        case .EdgeDetection:
            return "Other ID Document"
        case .EdgeDetectionA4Portrait:
            return "Edge Detection A4 Portrait"
        case .EdgeDetectionA4Landscape:
            return "Edge Detection A4 Landscape"
        case .EdgeDetectionA4:
            return "Edge Detection A4"
        case .Passport:
            return "Passport"
        case .EUDL:
            return "EU / UK Driver License"
        case .USDL:
            return "US Driver License"
        case .AustralianDL:
            return "Australian Driver License"
        case .SerbianID:
            return "Serbian ID Card"
        case .GermanID:
            return "German ID Card"
        case .AustrianID:
            return "Austrian ID Card"
        case .SlovakID:
            return "Slovak ID Card"
        case .SlovenianID:
            return "Slovenian ID Card"
        case .CzechID:
            return "Czech ID Card"
        case .CroatianID:
            return "Croatian ID Card"
        case .SingaporeID:
            return "Singapore ID Card"
        case .MalaysianID:
            return "Malaysian ID Card"
        case .PolishID:
            return "Polish ID Card"
        case .SouthAfricanGreenBook:
            return "South African Green Book"
        case .ColumbianID:
            return "Colombian ID card"
        case .EmiratesID:
            return "United Arab Emirates ID card"
        }
    }
}
