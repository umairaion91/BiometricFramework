//
//  ContentView.swift
//  AionBiometricsExample
//
//  Created by Aoin Digital on 03/07/2024.
//

import SwiftUI
import AionBiometrics

struct ContentView: View {
    
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Button("Start AionBiometrics") {
                isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                TestView().ignoresSafeArea()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TestView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = TestScanViewController
    
    func makeUIViewController(context: Context) -> TestScanViewController {
        let vc = TestScanViewController()
        let config = DocumentScanConfig(origin: .bahrain(.front))
        vc.coordinator = DocumentScanCoordinator(config: config, root: vc)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: TestScanViewController, context: Context) {
        
    }
    
}
