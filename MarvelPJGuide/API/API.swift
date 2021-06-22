//
//  API.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 15/06/2021.
//

import Foundation
import Alamofire

class API {

    func configHeaders() -> HTTPHeaders {

        var headers = HTTPHeaders()

        headers.add(HTTPHeader(name: "Accept", value: "application/json"))
        headers.add(HTTPHeader(name: "Content-Type", value: "application/json"))
        headers.add(HTTPHeader(name: "Accept-Language", value: NSLocale.preferredLanguages[0]))

        return headers
    }

    func getResponse(data: Data?) -> Any? {

        guard let data = data else { return nil }

        var info: Any?

        if let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

            info = dict

        } else if let array = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {

            info = array

        } else if let bool = String(data: data, encoding: .utf8).flatMap(Bool.init) {

            info = bool
        }

        return info
    }

    func getCustomError(error: AFError?) -> APIError? {

        guard let error = error else { return nil }

        return APIError(errorCode: error.responseCode, description: error.errorDescription)
    }
}
