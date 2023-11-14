//
//  PercentageStatisticView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 06.11.2022.
//

import UIKit
import EasyPeasy

class PercentageStatisticView: UIView {
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        return view
    }()
    
    var infoLAbel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hitting the first pitch"
        lbl.font = lbl.font.withSize(11)
        lbl.textColor = .white
        return lbl
    }()
    
    var hStack: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    let leftCustomPercentageView = LeftCustomPercentageView()
    
    let rightCustomPercentageView = RightCustomPercentageView()
    
    var leftPercentageInfoLAbel: UILabel = {
        let lbl = UILabel()
        lbl.text = "43 out of 60 = 72%"
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        return lbl
    }()
    
    var rightPercentageInfoLAbel: UILabel = {
        let lbl = UILabel()
        lbl.text = "42 out of 55 = 76%"
        lbl.font = lbl.font.withSize(11)
        lbl.textColor = .white
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
            Height(50)
        ])
        
        contentView.addSubview(infoLAbel)
        infoLAbel.easy.layout([
            Top(),
            CenterX()
        ])
        
        contentView.addSubview(hStack)
        hStack.easy.layout([
            Top(7).to(infoLAbel, .bottom)
        ])
        
        hStack.HStack(
            leftCustomPercentageView,
            rightCustomPercentageView,
            spacing: 5,
            distribution: .fill
        )
        
        contentView.addSubview(leftPercentageInfoLAbel)
        leftPercentageInfoLAbel.easy.layout([
            Top().to(hStack, .bottom),
            Leading()
        ])
        
        contentView.addSubview(rightPercentageInfoLAbel)
        rightPercentageInfoLAbel.easy.layout([
            Top().to(hStack, .bottom),
            Trailing()
        ])

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftCustomPercentageView.easy.layout(Width((contentView.viewWidth-5)/2))
        rightCustomPercentageView.easy.layout(Width((contentView.viewWidth-5)/2))
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
