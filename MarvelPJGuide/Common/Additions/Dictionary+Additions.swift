//
//  Dictionary+Additions.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

extension Dictionary {

    var queryString: String {
       var output: String = ""
       for (key, value) in self {
           output +=  "\(key)=\(value)&"
       }
       output = String(output.dropLast())
       return output
    }
}
