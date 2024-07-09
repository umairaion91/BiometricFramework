//
//  DocumentService.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 03/07/2024.
//

import DaonDocument

final class DocumentService {
    
    let options: DMDSOptions = DMDSOptions.init()
    let captureManager = DMDSCaptureManager.init()
    
    
    func prepareOptions(with config: DocumentScanConfig) -> DMDSOptions {
        
        /// Lisence-Key
        options.licenseKey = config.licenseKey
        
        /// Extension Factors
        options.extensionFactors = getExtensionFactors(top: config.extensionFactorTop,
                                                       bottom: config.extensionFactorBottom,
                                                       left: config.extensionFactorLeft,
                                                       right: config.extensionFactorRight)
        options.faceDetection = false
        
        /// Document Types
        options.documentTypes = config.origin.scan
        //NSMutableSet(array:[kIdDocument])
        //options.documentTypes = NSMutableSet(array:[kMrz])
        
        /// Barcode Types
        options.barcodeType = .none
        
        /// Scanning Duration
        let set = NSMutableSet()
        options.scanningDuration = getScannigDurration(from: set, config: config)
        
        
        /// Auto-start Scanning
        options.autoStartScanning = false
        
        // Fallback to Edge Detection - yes/no
        let fallbackEdgeDetection = config.isFallBackEdgeEnabled
        let fallbackEdgeDetectionDuration = "\(config.fallbackDuration)" as String?
        options.fallbackToEdgeDetection = fallbackEdgeDetection
        
        if (fallbackEdgeDetectionDuration != nil && (Int32(fallbackEdgeDetectionDuration!) != nil)) {
            options.fallbackToEdgeDetectionDuration = Int32(fallbackEdgeDetectionDuration!)!
        }
        
        // New 1.2 settings
        options.defaultUIOptions.allowManualCroppingEdgeDetection = true
        options.defaultUIOptions.allowManualCroppingDocumentRecognition = true
        
        let captureFace = config.isCaptureFace
        if(captureFace){
            options.faceDetection = captureFace
            let captureFaceThreshold = config.faceDocumentThreshold
            options.faceQualityScoreThreshold = captureFaceThreshold
        }
        
        return options
    }
    
    func getExtensionFactors(top: Float, bottom: Float,
                                     left: Float, right: Float) -> DMDSExtensionFactors {
        let extensionFactors = DMDSExtensionFactors()
        extensionFactors.extensionFactorTop = top
        extensionFactors.extensionFactorBottom = bottom
        extensionFactors.extensionFactorLeft = left
        extensionFactors.extensionFactorRight = right
        return extensionFactors
    }
    
    func getScannigDurration(from set: NSSet, config: DocumentScanConfig) -> Int32 {
        var scanningDuration = "\(config.duration)" as String?
        if(set.count == 1){
            // If the only object is "Other" then set the duration as the fallback
            scanningDuration = "\(config.fallbackDuration)" as String?
        }
        if let scanningDuration, (Int32(scanningDuration) != nil) {
            return Int32(scanningDuration)!
        }
        return Int32(0)
    }
}
