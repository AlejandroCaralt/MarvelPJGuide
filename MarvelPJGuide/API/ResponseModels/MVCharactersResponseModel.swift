//
//  MVCharactersResponseModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVCharactersResponseModel: APIModel, Codable {

    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [MVCharacterInfoModel]?

    init() {}

    init(dic: [String: Any]) {

        self.offset = dic["offset"] as? Int
        self.limit = dic["limit"] as? Int
        self.total = dic["total"] as? Int
        self.count = dic["count"] as? Int

        if let results = dic["results"] as? [[String: Any]] {
            self.results = MVCharacterInfoModel.createArray(results)
        }
    }
}
