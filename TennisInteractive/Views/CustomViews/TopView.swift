//
//  TopView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 02.11.2022.
//

import UIKit
import EasyPeasy

class TopView: UIView {
    
    var topLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        return view
    }()

    
    var backButton: UniversalButton = {
        let btn = UniversalButton()
        btn.backgroundView.setCorner(cornerRadius: 10)
        btn.btnImage.image = UIImage(named: "back_image")
        btn.btnImage.easy.layout([
            Center(),
            Height(20),
            Width(30)
        ])
        return btn
    }()
    
    var pageTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Page Title"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Inter-SemiBold", size: 17)
        return lbl
    }()
    
    var imageTextButton: UniversalButton = {
        let btn = UniversalButton()
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topLayer)
        topLayer.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
            Height(70)
        ])
        
        topLayer.addSubview(backButton)
        backButton.easy.layout([
            CenterY(),
            Leading(10),
            Height(40),
            Width(40)
        ])
        
        
        topLayer.addSubview(pageTitleLabel)
        pageTitleLabel.easy.layout([
            Center()
        ])
        
        
        topLayer.addSubview(imageTextButton)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
