//
//  MainBackground.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit
import EasyPeasy

class TabViewsBackground: UIView {
    
    var matchViewLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    var backgroundView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "background_image")
        img.backgroundColor = UIColor.tabViewColor
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(matchViewLayer)
        matchViewLayer.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
        matchViewLayer.addSubview(backgroundView)
        backgroundView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
