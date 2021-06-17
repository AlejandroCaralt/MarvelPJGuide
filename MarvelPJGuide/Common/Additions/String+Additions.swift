//
//  String+Additions.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 15/06/2021.
//

import Foundation
import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    var image: UIImage {
        return UIImage(named: self) ?? UIImage()
    }

    func date(_ format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let dateformated = formatter.date(from: self) else {
            //            return Date(timeIntervalSince1970: TimeInterval())
            return Date()
        }
        return dateformated
    }
}
