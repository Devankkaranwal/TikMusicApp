//
//  UIKit Extensions.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import Foundation
import UIKit


// MARK: - UIViewController
extension UIViewController{
    /// Status Bar Height
    func getStatusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    /// Display an alert view if the function is not implemented
    func showAlert(_ message: String, title: String? = nil){
        // Check if one has already presented
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = message
            return
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)


    }
}


// MARK: - UIViews
extension UIView {
    func makeRounded(color: UIColor, borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension UILabel {
    func UILableTextShadow(color: UIColor){
        self.textColor = color
        self.layer.masksToBounds = false
        self.layer.shadowOffset = .zero//CGSize(width: 1, height: 1)
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 1.0
    }
}
