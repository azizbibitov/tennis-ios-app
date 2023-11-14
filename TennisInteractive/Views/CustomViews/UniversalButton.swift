//
//  CustomButton.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit
import EasyPeasy

class UniversalButton: UIButton {
    
    var backgroundView = RoundedBackgroundView()
    
    var btnImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tennis_image2")
        return img
    }()
    
    var btnLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(backgroundView)
        backgroundView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
        backgroundView.addSubview(btnImage)
        
        backgroundView.addSubview(btnLabel)
        
    }
    

    
    
    
    func setImageSize(height: CGFloat, width: CGFloat){
        btnImage.easy.layout([
            Height(height),
            Width(width)
        ])
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
