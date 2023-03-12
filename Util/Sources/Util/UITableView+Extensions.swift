//
//  UITableView+Extensions.swift
//
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

public protocol ReusableCell: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

public extension ReusableCell where Self: UITableViewCell {
    static var reuseIdentifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
}

extension UITableViewCell: ReusableCell {}

public extension UITableView {
    func register<C: ReusableCell>(cell: C.Type) {
        self.register(C.nib, forCellReuseIdentifier: C.reuseIdentifier)
    }
    
    func dequeue<C: ReusableCell>(cell: C.Type, for indexPath: IndexPath) -> C {
        self.dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
    }
}
