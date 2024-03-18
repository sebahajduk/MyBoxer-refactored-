//
//  UIViewExtension.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 23/09/2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
