//
//  TestScanViewController.swift
//  Scanner
//
//  Created by Aoin Digital on 03/06/2024.
//

import UIKit
import AionBiometrics

class TestScanViewController: UIViewController {
    
    var coordinator: DocumentScanCoordinatorType!
    
    private var StartButton: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("Start AionBiometrics", for: .normal)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindCoordinatorResult()
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(StartButton)
        NSLayoutConstraint.activate([
            StartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            StartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            StartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            StartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        StartButton.addTarget(self, action: #selector(startDaonSDK), for: .touchUpInside)
    }
    
    @objc
    func startDaonSDK() {
        // coordinator.initializeDocumentScanner()
    }
    
    
    
    private func bindCoordinatorResult() {
        
//        coordinator.imageResult = {
//            print($0.0)
//            print($0.1)
//        }
//        
//        coordinator.stringResult = {
//            print($0.0)
//            print($0.1)
//        }
    }
    
    
}
