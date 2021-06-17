//
//  Font.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation
import UIKit

// MARK: System Font

extension UIFont {

    class func regular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    class func bold(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    class func italic(size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
    }

    class func light(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }

    class func black(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .black)
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }

    class func semiBold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}
