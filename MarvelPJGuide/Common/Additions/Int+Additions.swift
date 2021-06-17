//
//  Int+Additions.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

extension Int {

    func isAcceptableCode() -> Bool {
        let codes = Array(200..<300)
        return codes.contains(self)
    }
}
