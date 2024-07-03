//
//  UIImage+Extension.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import UIKit

extension UIImage {
    
    var base64Image: String? {
        return self.jpegData(compressionQuality: 0.4)?.base64EncodedString()
    }
    
}
