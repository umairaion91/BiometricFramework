//
//  GCD+Utility.swift
//  DaonSDK
//
//  Created by Aoin Digital on 03/06/2024.
//

import Foundation

struct Run {
    
    static func main(after delay: TimeInterval, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            execute()
        }
    }
    
    
}
