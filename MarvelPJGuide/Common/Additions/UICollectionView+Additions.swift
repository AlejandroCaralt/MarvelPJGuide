//
//  UICollectionView+Additions.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation
import UIKit

public extension UICollectionView {

    func register<T: UICollectionViewCell> (_ type: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.nibName)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {

        guard let cell = dequeueReusableCell(withReuseIdentifier: T.nibName, for: indexPath) as? T else {
            #if DEBUG
                fatalError("\(T.nibName) could not be dequeued as \(T.self)")
            #else
                return nil
            #endif
        }
        return cell
    }
}

public extension UICollectionViewCell {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
