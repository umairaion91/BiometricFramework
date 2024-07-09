//
//  ScanDocumentCoordinator.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit

/// Document Scaning Coordinator Type confirms the scaned document by returing
/// imageResult: Callback returns the scanned document Image
/// stringResult: Callback returns the scanned document images in String Encode-format
/// Usage Example:
/// var coordinator: DocumentScanCoordinatorType = DocumentScanCoordinator()
/// coordinator.initalize()
public protocol DocumentScanCoordinatorType {
    func initalize()
    var imageResult: ((ImageResult) -> ())? { get set }
    var stringResult: ((StringResult) -> ())? { get set }
}

final public class DocumentScanCoordinator: DocumentScanCoordinatorType {
    
    
    public var imageResult: ((ImageResult) -> ())? = nil
    
    public var stringResult: ((StringResult) -> ())? = nil
    
    
    private var repo = DocumentService()
    private var config: DocumentScanConfig
   
    private let root: UIViewController
    
    public init(config: DocumentScanConfig = DocumentScanConfig(origin: .none),
                root: UIViewController) {
        self.config = config
        self.root = root
    }
    
    public func initalize() {
        var documentScanner: ScanDocumentType = ScanDocument(config: config,
                                                             options: repo.prepareOptions(with: config),
                                                             service: repo.captureManager)
        
        
        let customOverlay = createCustomOverlay(with: documentScanner,
                                                allowDualSideScan: config.allowDualSideScan)
        
        documentScanner.intializeScan(with: customOverlay, for: root) { [unowned self] result in
            switch result {
            case .success(let success):
                print(success)
                // Upon sucess perform navigation to capture
                guard let camera = repo.captureManager.cameraController else { return }
                guard let navigation = root.navigationController else {
                    return root.present(camera, animated: true)
                }
                navigation.pushViewController(camera, animated: true)
            case .failure(_):
                fatalError("Daon Document Service Failed")
            }
        }
        
        /// Scanned Result as an Image
        documentScanner.result = { result in
            switch result {
            case .success(let image):
                print(image.base64Image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func createCustomOverlay(with service: ScanDocumentType,
                                     allowDualSideScan: Bool) -> CustomCaptureViewController {
        /// Property Base Injection for CustomOverLayViewController
        let customOverlay = CustomCaptureViewController()
        var viewModel: CustomCaptureViewVieModelType = CustomCaptureViewVieModel()
        customOverlay.viewModel = viewModel
        
        viewModel.onViewDidAppear = {
            service.startScan()
        }
        
        viewModel.viewDidLayoutSubview = {
            service.updateScanRegion(with: $0)
        }
        
        viewModel.stopScan = {
            service.stopScan()
        }
        
        viewModel.backScan = {
            service.updateDocumentOrigin(with: .bahrain(.back))
            service.startScan()
        }
        
        return customOverlay
    }
}
