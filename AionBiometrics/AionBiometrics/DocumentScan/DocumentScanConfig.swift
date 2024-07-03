//
//  DocumentScanConfig.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import Foundation

public struct DocumentScanConfig {
    
    var licenseKey = "sRwAAAEfY29tLmFpb25kaWdpdGFsLm9uYm9hcmRpbmcuZGVtbwX33aAbAGFsNrn0xLTeAtdY+Bs4wCGUL6sQgjWsEgwp0LXrGBkYLFcg52LCBurTFGA0Xl0XBTos/ccqwFfEVD41BGC4wtf62FD0xZvy5Pvuacm+4+icOKqw1ORho2ENFO7zVtxxLd5vkZLGbE4Llxwx6hAdftjkORQ8wmpjaSAIjXQRE7SG+uyNLlJjMb7iJ+4iAsVboXig0S6sPNyeb0WpPFmuq1BW/rgciOrWBp6/8FkcN1svGJv3XqFsqLN3o3qLqPeX9xmGEa12iFPZSkr5hYZuM2jLAnLvdWE3JO8zpnhOihICV6kZLRN3IgSjHYnbzIc8ALNu7FKHBQ=="
    
    var duration: Int = 60
    var fallbackDuration : Int = 60
    var isFallBackEdgeEnabled = false
    
    var isCaptureFace = false
    var quality: Float = 0.50
    var faceDocumentThreshold : Float = 0.4
    var autoFaceCapture = true
    
    var extensionFactorTop: Float = 0.03
    var extensionFactorBottom: Float = 0.03
    var extensionFactorLeft: Float = 0.03
    var extensionFactorRight: Float = 0.03
    
    var origin: DocumentOrigin = .none
    var scanResult: ScanResult = .unprocessed
    
    var allowDualSideScan = true
    
    init() {
        
    }
    
    // Convenience init to initialize the configurations from application
    init (duration: Int, fallbackDuration: Int, 
          isFallBackEdgeEnabled: Bool,
          isCaptureFace: Bool, quality: Float, 
          faceDocumentThreshold: Float, autoFaceCapture: Bool, 
          extensionFactorTop: Float, extensionFactorBottom: Float,
          extensionFactorLeft: Float, extensionFactorRight: Float, 
          origin: DocumentOrigin) {
        self.duration = duration
        self.fallbackDuration = fallbackDuration
        self.isFallBackEdgeEnabled = isFallBackEdgeEnabled
        self.isCaptureFace = isCaptureFace
        self.quality = quality
        self.faceDocumentThreshold = faceDocumentThreshold
        self.autoFaceCapture = autoFaceCapture
        self.extensionFactorTop = extensionFactorTop
        self.extensionFactorBottom = extensionFactorBottom
        self.extensionFactorLeft = extensionFactorLeft
        self.extensionFactorRight = extensionFactorRight
        self.origin = origin
    }
    
    public init (origin: DocumentOrigin) {
        self.origin = origin
    }
}
