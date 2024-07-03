//
//  DocumentInfoModel.swift
//  DaonSDK
//
//  Created by Aoin Digital on 02/06/2024.
//

import Foundation

class DocumentInfoModel: NSObject {
   var name : String
   var type : String
   
   init(docName: String, docType: String) {
       name = docName
       type = docType
   }
}
