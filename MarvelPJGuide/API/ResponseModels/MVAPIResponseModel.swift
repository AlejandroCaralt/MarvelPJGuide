//
//  MVAPIResponseModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVAPIResponseModel: Codable {

    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: MVCharactersResponseModel?
    
    init() {}
    
    init(dic: [String: Any]) {

        self.code = dic["code"] as? Int
        self.status = dic["status"] as? String
        self.copyright = dic["copyright"] as? String
        self.attributionText = dic["attributionText"] as? String
        self.attributionHTML = dic["attributionHTML"] as? String
        self.etag = dic["etag"] as? String
        
        if let data = dic["data"] as? [String: Any] {
            self.data = MVCharactersResponseModel(dic: data)
        }
    }
}
