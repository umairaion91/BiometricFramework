//
//  ScanDocument.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit
import DaonDocument

protocol ScanDocumentType {
    var result: ((Result<UIImage, Error>)->())? { get set }
    func startScan()
    func stopScan()
    func updateScanRegion(with frame: CGRect)
    func intializeScan(with overlay: CustomCaptureViewController,
                       for parent: UIViewController,
                       completion: @escaping (Result<Bool, Error>)->())
    func updateDocumentOrigin(with type: DocumentOrigin)
}

final class ScanDocument: NSObject, ScanDocumentType {
    
    
    private var config: DocumentScanConfig
    private var service: DMDSCaptureManager
    let options: DMDSOptions
    var selectedDocument = DocumentInfoModel(docName: DocumentType.EdgeDetection.value,
                                                                 docType: kEdgeDetection)
    var result: ((Result<UIImage, Error>) -> ())? = nil
    
    init(config: DocumentScanConfig,
         options: DMDSOptions, service: DMDSCaptureManager) {
        self.config = config
        self.options = options
        self.service = service
    }
    
    func intializeScan(with overlay: CustomCaptureViewController, 
                       for parent: UIViewController,
                       completion: @escaping (Result<Bool, Error>)->()) {
        service.setScanningRegion(parent.view.frame)
        service.startScanning()
        customCaputre(with: overlay, for: self.options, completion: completion)
    }
    
    func startScan() {
        service.startScanning()
    }
    
    func stopScan() {
        service.stopScanning()
    }
    
    func updateScanRegion(with frame: CGRect) {
        service.setScanningRegion(frame)
    }
    
    func updateDocumentOrigin(with type: DocumentOrigin) {
        service.updateDocumentTypes(type.scan)
    }
    
    private func customCaputre(with overlay: CustomCaptureViewController,
                               for options: DMDSOptions,
                               completion: @escaping (Result<Bool, Error>)->()) {
        service.customCapture(withOverlay: overlay, cameraOptions: options) { error in
            error != nil ? completion(.failure(error!)) : completion(.success(true))
        }
    }
    
}

extension ScanDocument: DMDSDefaultScanDelegate {
    
    func documentScanned(_ cameraViewController: UIViewController,
                         result scanningResult: DMDSResult) {
        cameraViewController.dismiss(animated: true) {
            // Document Scanning Completed
            // Send Callback to Parent Notifiying the result
            guard let document = scanningResult.document else { return }
            switch self.config.scanResult {
            case .processed:
                self.result?(.success(document.processedImage))
            case .unprocessed:
                self.result?(.success(document.unprocessedImage))
            }
        }
    }
    
    func documentScanFailed(_ cameraViewController: UIViewController, 
                            error: any Error, result scanningResult: DMDSResult) {
        cameraViewController.dismiss(animated: true) {
            // Document Scanning Failed
            // Send Callback to Parent Notifiying the Error
            self.result?(.failure(error))
        }
    }
}
