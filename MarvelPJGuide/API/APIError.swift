//
//  APIError.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 15/06/2021.
//

import Foundation
import Alamofire

class APIError {

    var code: Int = 500
    var message: String = "generic_error".localized

    init() {}

    init(errorCode: Int?, description: String?) {

        code = errorCode ?? 500
        message = description ?? "generic_error".localized
    }
}
