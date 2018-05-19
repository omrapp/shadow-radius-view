//
//  ShadowWithCornerRadiusView.swift

//  Created by Omar Ayed
//  Copyright © 2018 Discount. All rights reserved.
//

import UIKit

class ShadowWithCornerRadiusView: UIView {

    var cornerMaskLayer = CAShapeLayer()
    
    @IBInspectable var topLeftRadius: CGFloat = 0 {
        didSet {
            updateProperties()
        }
    }
    
    @IBInspectable var topRightRadius: CGFloat = 0 {
        didSet {
            updateProperties()
        }
    }
    
    @IBInspectable var bottomLeftRadius: CGFloat = 0 {
        didSet {
            updateProperties()
        }
    }
    
    @IBInspectable var bottomRightRadius: CGFloat = 0 {
        didSet {
            updateProperties()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            updateProperties()
        }
    }
   
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            updateProperties()
        }
    }
   
    @IBInspectable var shadowRadius: CGFloat = 10.0 {
        didSet {
            updateProperties()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            updateProperties()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       setup()
    }
    
    func setup() {
        layer.masksToBounds = false
        
        updateCornersRadius()
        updateProperties()
        updateShadowPath()
    }
    
    fileprivate func updateCornersRadius() {
        
        let cornerPath = UIBezierPath(roundedRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        cornerMaskLayer = CAShapeLayer()
        cornerMaskLayer.path = cornerPath.cgPath
        cornerMaskLayer.fillColor = backgroundColor?.cgColor
        backgroundColor = UIColor.clear
        layer.insertSublayer(cornerMaskLayer, below: nil)
    }
    
    fileprivate func updateProperties() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    fileprivate func updateShadowPath() {
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateShadowPath()
        
        let cornerPath = UIBezierPath(roundedRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        cornerMaskLayer.path = cornerPath.cgPath
    }
}
