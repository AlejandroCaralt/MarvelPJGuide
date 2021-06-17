//
//  MVAPIAuthenticationModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation
import CryptoSwift

class MVAPIAuthenticationModel: Codable {
    
    var ts: Int = 0
    var apikey: String = ""
    var hash: String = ""

    init() {

        if let pblkey = Bundle.main.object(forInfoDictionaryKey: "MarvelAPIPublicKey") as? String {
            self.apikey = pblkey
        }

        self.ts = Int(Date().timeIntervalSince1970)

        if let prvkey = Bundle.main.object(forInfoDictionaryKey: "MarvelAPIPrivateKey") as? String {
            self.hash = "\(ts)\(prvkey)\(apikey)".md5()
        }
    }
}
