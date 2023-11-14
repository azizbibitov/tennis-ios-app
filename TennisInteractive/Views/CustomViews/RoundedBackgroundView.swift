//
//  RoundedBackgroundView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit


class RoundedBackgroundView: UIView {
    
//    var cornerRadius : CGFloat = 0.0
//    var borderWidth : CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //make here what you want
        
        backgroundColor = .roundedBackgroundViewColor
    }
    
    
    func setCorner(cornerRadius: CGFloat){
        layer.cornerRadius = cornerRadius
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: CGColor){
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
    
    func setShadow(shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
