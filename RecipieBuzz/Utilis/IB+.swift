//
//  IB.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 02/10/23.
//

import UIKit
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue
              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}
