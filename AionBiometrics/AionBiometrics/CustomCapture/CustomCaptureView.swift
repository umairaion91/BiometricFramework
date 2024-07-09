//
//  CustomCaptureView.swift
//  AionBiometrics
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit

final class CustomCaptureView: UIView {
    
    private struct Config {
        static let height: Double = 250
        static let alpha: CGFloat = 0.300000011920929
        static let backgroundColor: UIColor = .clear
        static let scanRegionColor: UIColor = .white
        static let padding: Double = 20
        static let cornerRadius: Double = 20.0
        static let labelAlignment: NSTextAlignment = .center
        static let borderColor: UIColor = .blue
        static let borderWidth: Double = 1.0
    }
    
    lazy var scanRegionView: UIView = {
        let view = UIView()
        view.backgroundColor = Config.scanRegionColor
        view.alpha = Config.alpha
        view.layer.cornerRadius = Config.cornerRadius
        view.layer.borderColor = Config.borderColor.cgColor
        view.layer.borderWidth = Config.borderWidth
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scanSideLabel: UILabel = {
        let label = UILabel()
        label.text = "Scaning Document"
        label.textColor = .white
        label.textAlignment = Config.labelAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubView(in parent: UIViewController) {
        parent.view.addSubview(self)
        parent.view.backgroundColor = Config.backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor)
        ])
    }
    
    private func setupView() {
        [backButton, scanRegionView, scanSideLabel].forEach(addSubview)
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            scanRegionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scanRegionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            scanRegionView.widthAnchor.constraint(equalTo: widthAnchor, 
                                                  constant: -CGFloat(Config.padding * 2)),
            scanRegionView.heightAnchor.constraint(equalToConstant: CGFloat(Config.height)),
            
            scanSideLabel.topAnchor.constraint(equalTo: 
                                                scanRegionView.bottomAnchor,
                                               constant: 10),
            scanSideLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: 
                                                safeAreaLayoutGuide.topAnchor,
                                            constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, 
                                                constant: 10)
        ])
    }
    
}
