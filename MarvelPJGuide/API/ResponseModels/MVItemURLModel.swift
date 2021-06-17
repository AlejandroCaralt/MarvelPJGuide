//
//  MVItemURLModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVItemURLModel: APIModel, Codable {
    
    var type: String?
    var url: String?

    init() {}

    init(dic: [String: Any]) {
        self.type = dic["type"] as? String
        self.url = dic["url"] as? String
    }
}
