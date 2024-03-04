//
//  Colors.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import Foundation
import UIKit


struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}


public let baseWhiteColor = UIColor.rgb(red: 234, green: 236, blue: 238)

extension UIColor {
    
    @objc static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let Background = UIColor(named: "Background")!
    static let LabelBackground = UIColor(named: "LabelBackground")!
    static let Yellow = UIColor(named: "Yellow")!
    static let Blue = UIColor(named: "Blue")
    static let Red = UIColor(named: "Red")
    
    static let tealColor = UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)
    static let lightRed = UIColor.init(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
    static let darkBlue = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
    static let lightBlue = UIColor(red: 218/255, green: 235/255, blue: 243/255, alpha: 1)

}



extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @objc func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    @objc func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
    
    
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    
    func constrainToTop(paddingTop: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
    }
    
    
    func constrainToBottom(paddingBottom: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let bottom = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
    }
    
    func constrainToLeft(paddingLeft: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = superview?.leftAnchor {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
    }
    
    
    func constrainToRight(paddingRight: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let right = superview?.rightAnchor {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
    }
    
    func constrainToRight(paddingRight: CGFloat, superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let right = superView.rightAnchor
        self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        
    }
    
    
    func constrainToTop(paddingTop: CGFloat, superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
         let top = superView.topAnchor
        self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    
    func constrainToBottom(paddingBottom: CGFloat, superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let bottom = superView.bottomAnchor
        self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        
    }
    
    
    
    
    func constrainToLeft(paddingLeft: CGFloat, superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let left = superView.rightAnchor
        self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        
    }
    
    
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    
    

    
    
    /// Flip view 180, true to rotate 180, false to return to identity
    func handleRotate180(rotate: Bool) {
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.transform = rotate == true ? CGAffineTransform(rotationAngle: CGFloat.pi) : .identity
        }
        
    }
    
}

func navBarFont(size: CGFloat)-> UIFont {
//    let defaultFont = UIFont(name: Fonts.soundsGood, size: size)!
    let defaultFont = UIFont.systemFont(ofSize: size, weight: .heavy)

    return defaultFont

}
