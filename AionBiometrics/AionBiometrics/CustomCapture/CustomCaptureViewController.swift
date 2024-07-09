//
//  CusotmCaptureOverlay.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit
import DaonDocument

final class CustomCaptureViewController: UIViewController {
    
    //MARK: Properties
    var viewModel: CustomCaptureViewVieModelType!
    let capture = CustomCaptureView()
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        capture.addSubView(in: self)
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Run.main(after: 2.0) {
            self.viewModel.onViewDidAppear?()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let rectRegion = getFrameCoordinates()
        viewModel.performFrontScan(with: rectRegion)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func bindViewModel() {
        viewModel.flipScanRegion = {
            self.flipScanRegion()
        }
    }
    
    private func getFrameCoordinates() -> CGRect {
        
        let originX = capture.scanRegionView.frame.origin.x
        let originY = capture.scanRegionView.frame.origin.y
        let originWidth = capture.scanRegionView.frame.size.width
        let originHeight = capture.scanRegionView.frame.size.height
        
        let xCordinate : CGFloat =  originX / self.view.frame.size.width
        let yCordinate : CGFloat =  originY / self.view.frame.size.height
        
        let boundWidth : CGFloat = originWidth / self.view.frame.size.width
        let boundHeight : CGFloat = originHeight / self.view.frame.size.height
        
        let rectRegion = CGRect(x: xCordinate, y: yCordinate, width: boundWidth, height: boundHeight)
        debugPrint("Scanning region: ", rectRegion)
        
        return rectRegion
    }
    
    private func flipScanRegion() {
        capture.scanRegionView.isHidden = true
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: capture.scanRegionView, 
                          duration: 6.0,
                          options: transitionOptions,
                          animations: {
            self.capture.scanRegionView.isHidden = false
        })
        let rectRegion = getFrameCoordinates()
        viewModel.performBackScan(with: rectRegion)
    }
    
}

extension CustomCaptureViewController: DMDSCustomScanDelegate {
    
    func documentScanFailedWithError(_ error: Error, result: DMDSResult?) {
        viewModel.failure(with: error)
    }
    
    func documentScanned(with scanningResult: DMDSResult) {
        guard let processedImage =  scanningResult.document.processedImage else { return }
        viewModel.success(with: processedImage)
    }
    
    func mrzDetected(_ mrzDetected: DMDSMrzDetectionMetadata) {
        print("Mrz detected")
    }
    
    func documentDetected(_ documentDetected: DMDSDocumentDetectionMetadata) {
        print("Document Detected \(documentDetected)")
    }
    
    func fallingBackToEdgeDetection() {
        print("Falling back to edge detection")
    }
    
    func didDetectGlare(withResult glare: Bool) {
        if glare {
            print("Too much glare")
        } else {
            print("Line up your identity document to fit in frame")
        }
        print("Glare detected callback \(glare)")
    }
    
    func detectionTimeoutWithError(_ error: Error) {
        viewModel.failure(with: error)
    }
}
