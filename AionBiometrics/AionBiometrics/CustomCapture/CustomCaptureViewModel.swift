//
//  CustomCaptureViewModel.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit

protocol CustomCaptureViewVieModelType {
    
    var onViewDidAppear: (()->())? { get set }
    var viewDidLayoutSubview: ((CGRect)->())? { get set }
    var backScan: (()->())? { get set }
    
    var stopScan: (()->())? { get set }
    var flipScanRegion: (()->())? { get set }
    
    func failure(with error: Error)
    func success(with image: UIImage)
    func performFrontScan(with region: CGRect)
    func performBackScan(with region: CGRect)
    
}

final class CustomCaptureViewVieModel: CustomCaptureViewVieModelType {
    
    var stopScan: (() -> ())? = nil
    var onViewDidAppear: (() -> ())? = nil
    var viewDidLayoutSubview: ((CGRect)->())? = nil
    var flipScanRegion: (()->())? = nil
    var backScan: (()->())? = nil
    
    private var allowDualSideScan: Bool
    var isScanCompleted: Bool = false
    
    init(allowDualSideScan: Bool = true) {
        self.allowDualSideScan = allowDualSideScan
    }
    
    func failure(with error: Error) {
        //title: "Error"
        //NSLocalizedString("UnableToConnect", comment: "")
        //        self.closeCamera()
        //        if error.localizedDescription == "Unable to capture the document in the allotted time." {
        //            self.showAlertViewWithTitle(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("UnableToCapture", comment: ""))
        //        } else {
        //            self.showAlertViewWithTitle(title: NSLocalizedString("Error", comment: ""), message: error.localizedDescription)
        //        }
        debugPrint(error.localizedDescription)
        debugPrint("UnableToCapture")
        stopScan?()
    }
    
    func success(with image: UIImage) {
        debugPrint("Success: ", image.base64Image)
        (allowDualSideScan == true && !isScanCompleted) ? performBackScan() : notify(with: image)
    }
    
    func performFrontScan(with region: CGRect) {
        debugPrint("Performing: Front Scan")
        viewDidLayoutSubview?(region)
    }
    
    func performBackScan(with region: CGRect) {
        // Mark isScanCompleted = true
        isScanCompleted = true
        viewDidLayoutSubview?(region)
        backScan?()
    }
    
    private func performBackScan() {
        // Perform flip animation
        // Setup back scan region
        debugPrint("Performing: Back Scan")
        flipScanRegion?()
    }
    
    
    
    func notify(with result: UIImage) {
        
    }
    
}

//func backSideScan(){
//    flip()
//    let documentType = NSMutableSet(array: [kid])
//    self.captureManager.updateDocumentTypes(documentType)
//    
//    self.labelScan.text = NSLocalizedString("backCardScanDaon", comment: "")
//    self.labelScan.font = LanguageManager.boldFont(size: UIConfiguration.kFontSizeLarge)
//    
//    isMultiSide = false
//    scanType = .Back
//    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//        self.captureManager.restartScanning()
//        self.scanningRegion.isHidden = false
//    }
//    // If auto start scanning is off, then call to start scanning
//    if(self.captureManager.options != nil){
//        if(!self.captureManager.options!.autoStartScanning){
//            // Add a delay before capturing
//            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//                self.captureManager.startScanning()
//                self.scanningRegion.isHidden = false
//            }
//        }
//    }
//}

//func animation(){
//    self.captureManager.stopScanning()
//    self.labelScan.text = NSLocalizedString("backCardScanDaon", comment: "")
//    self.labelScan.font = LanguageManager.boldFont(size: UIConfiguration.kFontSizeLarge)
//    self.backSideScan()
//}


//func dismissView(with scanningResult: DMDSResult) {
//    switch scanType{
//    case .Front:
//        frontResult = scanningResult
//        animation()
//        
//    case .Back:
//        if frontResult != nil {
//            self.delegate?.frontScanCompleted(with: frontResult!)
//            self.delegate?.backScanCompleted(with: scanningResult)
//        }
//        self.navigationController?.popViewController(animated: true)
//    case .Passport:
//        break
//    case .none:
//        self.delegate?.frontScanCompleted(with: scanningResult)
//    }
//}
