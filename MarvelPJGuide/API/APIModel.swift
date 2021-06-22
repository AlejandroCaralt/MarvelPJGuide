//
//  APIModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

protocol APIModel {

    init(dic: [String: Any])
    static func createArray(_ items: [[String: Any]]) -> [Self]
    func toDictionary() -> [String: Any]
    static func createDictionaryArray(items: [Self]) -> [[String: Any]]
}

extension APIModel {

    static func createArray(_ items: [[String: Any]]) -> [Self] {

        var models: [Self] = []
        for item in items {
            models.append(Self(dic: item))
        }
        return models
    }

    func toDictionary() -> [String: Any] {

        var info: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let key = child.label else {
                continue
            }
            info[key] = child.value
        }
        return info
    }

    static func createDictionaryArray(items: [Self]) -> [[String: Any]] {
        var info: [[String: Any]] = []
        for item in items {
            info.append(item.toDictionary())
        }
        return info

    }
}
