//
//  StatisticMatchView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 02.11.2022.
//

import UIKit
import EasyPeasy

class StatisticMatchView: UIView {
    
    let backgroundView = TabViewsBackground()
    
    let topView = TopView()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    var scrollingLayer: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: Match Details' Views
    var matchDetailsLayerWithRoundedBack: RoundedBackgroundView = {
        let roundedBack = RoundedBackgroundView()
        roundedBack.setCorner(cornerRadius: 20)
        roundedBack.setBorder(borderWidth: 0, borderColor: UIColor.black.cgColor)
        roundedBack.setShadow(shadowOpacity: 0.4, shadowRadius: 4.0, shadowOffset: CGSize(width: 3, height: 3))
        return roundedBack
    }()
    
    var VStackInCenter: UIView = {
        let view = UIView()
        return view
    }()
    
    
    var name1Label: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(13)
        lbl.textAlignment = .right
        lbl.textColor = .white
        lbl.text = "Juniors"
        return lbl
    }()
    
    var image1: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tennis_image1")
        img.backgroundColor = .white
        img.layer.cornerRadius = 15
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    var dateAndTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        lbl.textAlignment = .center
        lbl.text = "15 oct | 13:30"
        return lbl
    }()
    
    var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        lbl.textAlignment = .center
        lbl.textColor = .matchTimeGoldColor
        lbl.text = "0:2"
        
        return lbl
    }()
    
    var name2Label: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(13)
        lbl.textAlignment = .left
        lbl.text = "Champions "
        lbl.textColor = .white
        return lbl
    }()
    
    var image2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tennis_image2")
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .white
        img.layer.cornerRadius = 15
        return img
    }()
    
    
    var gameBoardView: GameBoard = {
        let view = GameBoard()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    var stadiumPlaceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        lbl.text = "Stadium: Olympic Tennis Center. Central Court"
        return lbl
    }()
    
    var coatingLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        lbl.text = "Coating: Hard"
        return lbl
    }()
    
    var durationLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        lbl.text = "Duration: 1 hour and 31 minutes"
        return lbl
    }()
    
    let percentageStatisticView1 = PercentageStatisticView()
    
    let percentageStatisticView2 = PercentageStatisticView()
    
    let percentageStatisticView3 = PercentageStatisticView()
    
    let percentageStatisticView4 = PercentageStatisticView()
    
    let percentageStatisticView5 = PercentageStatisticView()
    
    
    var backImageCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        topView.backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backImageTap)))
        
        self.addSubview(backgroundView)
        backgroundView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
        backgroundView.addSubview(topView)
        topView.easy.layout([
            Top().to(safeAreaLayoutGuide, .top),
            Leading(),
            Trailing(),
        ])
        
        
        setupMatchStatisticViews()
        
    }
    
    func setupMatchStatisticViews() {
        
        addSubview(scrollView)
        scrollView.easy.layout([
            Top().to(topView, .bottom),
            Leading(),
            Trailing(),
            Bottom(safeAreaInsets.bottom + 20).to(backgroundView, .bottom)
        ])
        
        scrollView.addSubview(scrollingLayer)
        scrollingLayer.easy.layout([
            Top().to(scrollView, .top),
            Leading().to(scrollView, .leading),
            Trailing().to(scrollView, .trailing),
            Bottom().to(scrollView, .bottom),
            Width(UIScreen.main.bounds.width),
        ])
        
        
        
        scrollingLayer.addSubview(matchDetailsLayerWithRoundedBack)
        matchDetailsLayerWithRoundedBack.easy.layout([
            Top(10).to(scrollingLayer, .top),
            Leading(10),
            Trailing(10),
            Height(260)
        ])
        
        
        VStackInCenter.VStack(
            dateAndTimeLabel,
            spacing: 5
        )
        .padding([.horizontalMargins], amount: 2)
        
        matchDetailsLayerWithRoundedBack.addSubview(VStackInCenter)
        VStackInCenter.easy.layout([
            Top(30),
            CenterX()
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(image1)
        image1.easy.layout([
            CenterY().to(VStackInCenter, .centerY),
            Trailing(5).to(VStackInCenter, .leading)
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(name1Label)
        name1Label.easy.layout([
            CenterY().to(image1, .centerY),
            Trailing(10).to(image1, .leading),
            Leading().to(matchDetailsLayerWithRoundedBack, .leading)
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(image2)
        image2.easy.layout([
            CenterY().to(VStackInCenter, .centerY),
            Leading(5).to(VStackInCenter, .trailing)
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(name2Label)
        name2Label.easy.layout([
            CenterY().to(image2, .centerY),
            Leading(10).to(image2, .trailing),
            Trailing().to(matchDetailsLayerWithRoundedBack, .trailing)
        ])
        
        
        image1.easy.layout([Height(50), Width(50)])
        image2.easy.layout([Height(50), Width(50)])
        
        matchDetailsLayerWithRoundedBack.addSubview(scoreLabel)
        scoreLabel.easy.layout([
            Top(10).to(image1, .bottom),
            CenterX()
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(gameBoardView)
        gameBoardView.easy.layout([
            Top(15).to(scoreLabel, .bottom),
            CenterX(),
            Height(80),
            Width(80)
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(stadiumPlaceLabel)
        stadiumPlaceLabel.easy.layout([
            Top(10).to(gameBoardView, .bottom),
            CenterX()
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(coatingLabel)
        coatingLabel.easy.layout([
            Top(5).to(stadiumPlaceLabel, .bottom),
            CenterX()
        ])
        
        matchDetailsLayerWithRoundedBack.addSubview(durationLabel)
        durationLabel.easy.layout([
            Top(5).to(coatingLabel, .bottom),
            CenterX()
        ])
        
        scrollingLayer.addSubview(percentageStatisticView1)
        percentageStatisticView1.easy.layout([
            Top(30).to(matchDetailsLayerWithRoundedBack, .bottom),
            Leading(10),
            Trailing(10),
        ])
        
        scrollingLayer.addSubview(percentageStatisticView2)
        percentageStatisticView2.easy.layout([
            Top(10).to(percentageStatisticView1, .bottom),
            Leading(10),
            Trailing(10),
        ])
        
        scrollingLayer.addSubview(percentageStatisticView3)
        percentageStatisticView3.easy.layout([
            Top(10).to(percentageStatisticView2, .bottom),
            Leading(10),
            Trailing(10),
        ])
        
        scrollingLayer.addSubview(percentageStatisticView4)
        percentageStatisticView4.easy.layout([
            Top(10).to(percentageStatisticView3, .bottom),
            Leading(10),
            Trailing(10),
        ])
        
        scrollingLayer.addSubview(percentageStatisticView5)
        percentageStatisticView5.easy.layout([
            Top(10).to(percentageStatisticView4, .bottom),
            Leading(10),
            Trailing(10),
            Bottom().to(scrollingLayer, .bottom)
        ])
        
    
        
    }

    
    @objc func backImageTap() {
        backImageCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
