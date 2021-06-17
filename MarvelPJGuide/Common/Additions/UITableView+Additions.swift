//
//  UITableView+Additions.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation
import UIKit

extension UITableView {

    func register<T: UITableViewCell> (_ type: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.nibName)
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName) as? T else {
            #if DEBUG
                fatalError("\(T.nibName) could not be dequeued as \(T.self)")
            #else
                return nil
            #endif
        }
        return cell
    }

}

extension UITableViewCell {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
