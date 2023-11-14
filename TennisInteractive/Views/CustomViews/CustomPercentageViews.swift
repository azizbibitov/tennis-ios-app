//
//  CustomPercentageView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 06.11.2022.
//

import UIKit
import EasyPeasy


class LeftCustomPercentageView: UIView {
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    var percentageLayers: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        return view
    }()
    
    var fullPercentageLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .percentageUnderLayer1
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    var dynamicPercentageLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .percentageUponLayer1
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    var percentage: CGFloat = 0.7
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
            Height(15)
        ])
        
        contentView.addSubview(percentageLayers)
        percentageLayers.easy.layout([
            Center(),
            Height(5),
            Trailing(),
            Leading()
        ])
        
        percentageLayers.addSubview(fullPercentageLayer)
        fullPercentageLayer.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
        ])
        
        percentageLayers.addSubview(dynamicPercentageLayer)
        dynamicPercentageLayer.easy.layout([
            Top(),
            Trailing(),
            Bottom(),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dynamicPercentageLayer.easy.layout([
            Width(contentView.viewWidth * percentage)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class RightCustomPercentageView: UIView {
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    var percentageLayers: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        return view
    }()
    
    var fullPercentageLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .percentageUnderLayer2
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    var dynamicPercentageLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .percentageUponLayer2
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    var percentage: CGFloat = 0.2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
            Height(15)
        ])
        
        contentView.addSubview(percentageLayers)
        percentageLayers.easy.layout([
            Center(),
            Height(5),
            Trailing(),
            Leading()
        ])
        
        percentageLayers.addSubview(fullPercentageLayer)
        fullPercentageLayer.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom(),
        ])
        
        percentageLayers.addSubview(dynamicPercentageLayer)
        dynamicPercentageLayer.easy.layout([
            Top(),
            Leading(),
            Bottom(),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dynamicPercentageLayer.easy.layout([
            Width(contentView.viewWidth * percentage)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
