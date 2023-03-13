//
//  File.swift
//  
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

public extension ReusableCell where Self: UICollectionViewCell {
    static var reuseIdentifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
}

extension UICollectionViewCell: ReusableCell {}

public extension UICollectionView {
    func register<C: ReusableCell>(cell: C.Type) {
        self.register(C.nib, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
    
    func dequeue<C: ReusableCell>(cell: C.Type, for indexPath: IndexPath) -> C {
        self.dequeueReusableCell(withReuseIdentifier: C.reuseIdentifier, for: indexPath) as! C
    }
}
