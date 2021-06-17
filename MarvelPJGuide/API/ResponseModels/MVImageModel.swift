//
//  MVImageModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVImageModel: APIModel, Codable {
    
    var path: String?
    var imageExt: String?

    init() {}

    init(dic: [String: Any]) {
        self.path = dic["path"] as? String
        self.imageExt = dic["extension"] as? String
    }

    func getImageUrl() -> String? {

        guard let path = path,
              let imageExt = imageExt else { return nil }
        
        return "\(path).\(imageExt)"
    }
}
