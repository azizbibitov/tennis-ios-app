//
//  MatchCell.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit
import EasyPeasy

class MatchCell: UITableViewCell {
    
    var cellLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.0)
        return view
    }()
    
    
    //MARK: Match Details' Views
    var matchDetailsLayerWithRounderBack: RoundedBackgroundView = {
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
    
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .matchTimeGoldColor
        lbl.font = lbl.font.withSize(11)
        lbl.textAlignment = .center
        lbl.text = "22:22"
        return lbl
    }()
    
    var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(11)
        lbl.textAlignment = .center
        lbl.text = "15 oct"
        lbl.textColor = .white
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
    
    
    //MARK: History Buttons' Views
    var historyBtnsLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    var team1HistoryBtn: UniversalButton = {
        let btn = UniversalButton()
        btn.backgroundView.setCorner(cornerRadius: 20)
        btn.backgroundView.setBorder(borderWidth: 0.3, borderColor: UIColor.black.cgColor)
        btn.backgroundView.setShadow(shadowOpacity: 0.8, shadowRadius: 2.0, shadowOffset: CGSize(width: 0.0, height: 0.0))
        btn.btnLabel.text = "History"
        btn.btnLabel.font = btn.btnLabel.font.withSize(13)
        btn.btnLabel.textAlignment = .center
        btn.btnLabel.easy.layout([
            Center(),
            Height(30),
            Width(95)
        ])
        return btn
    }()
    
    var team2HistoryBtn: UniversalButton = {
        let btn = UniversalButton()
        btn.backgroundView.setCorner(cornerRadius: 20)
        btn.backgroundView.setBorder(borderWidth: 0.3, borderColor: UIColor.black.cgColor)
        btn.backgroundView.setShadow(shadowOpacity: 0.8, shadowRadius: 2.0, shadowOffset: CGSize(width: 0.0, height: 0.0))
        btn.btnLabel.text = "History"
        btn.btnLabel.font = btn.btnLabel.font.withSize(13)
        btn.btnLabel.textAlignment = .center
        btn.btnLabel.easy.layout([
            Center(),
            Height(30),
            Width(95)
        ])
        return btn
    }()
    
    var team1HistoryBtnCallback: ( ()->Void )?
    var team2HistoryBtnCallback: ( ()->Void )?
    
    //MARK: Init methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        team1HistoryBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(team1HistoryBtnTap)))
        
        team2HistoryBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(team2HistoryBtnTap)))
        
        self.contentView.addSubview(cellLayer)
        cellLayer.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
        setupCellLayerViews()
        
    }
    
    func setupCellLayerViews(){
        
        // Using Stack View extension files in Extensions folder.
       
        
        cellLayer.VStack(
            matchDetailsLayerWithRounderBack,
            historyBtnsLayer,
            spacing: 10
        )
        .padding([.verticalMargins], amount: 10)
        
        matchDetailsLayerWithRounderBack.easy.layout([
            Leading(10),
            Trailing(10),
            Height(80)
        ])
        
        VStackInCenter.VStack(
            timeLabel,
            dateLabel,
            spacing: 5
        )
        .padding([.horizontalMargins], amount: 5)
        
        matchDetailsLayerWithRounderBack.addSubview(VStackInCenter)
        VStackInCenter.easy.layout([
            Center()
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(image1)
        image1.easy.layout([
            CenterY().to(VStackInCenter, .centerY),
            Trailing(15).to(VStackInCenter, .leading)
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(name1Label)
        name1Label.easy.layout([
            CenterY().to(image1, .centerY),
            Trailing(10).to(image1, .leading),
            Leading().to(matchDetailsLayerWithRounderBack, .leading)
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(image2)
        image2.easy.layout([
            CenterY().to(VStackInCenter, .centerY),
            Leading(15).to(VStackInCenter, .trailing)
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(name2Label)
        name2Label.easy.layout([
            CenterY().to(image2, .centerY),
            Leading(10).to(image2, .trailing),
            Trailing().to(matchDetailsLayerWithRounderBack, .trailing)
        ])
        
        

        
        historyBtnsLayer.HStack(
            team1HistoryBtn,
            team2HistoryBtn,
            distribution: .equalCentering
        )
        .padding([.horizontalMargins], amount: 45)
        
        team1HistoryBtn.easy.layout([Height(40), Width(110)])
        team2HistoryBtn.easy.layout([Height(40), Width(110)])
        
        image1.easy.layout([Height(50), Width(50)])
        image2.easy.layout([Height(50), Width(50)])
        
    }
    
    func configure(data: MatchModel){
        
        name1Label.text = data.name1
        name2Label.text = data.name2
        image1.image = UIImage(named: data.image1)
        image2.image = UIImage(named: data.image2)
        timeLabel.text = data.time
        dateLabel.text = data.date
    }
    
    @objc func team1HistoryBtnTap() {
        team1HistoryBtnCallback?()
    }
    
    @objc func team2HistoryBtnTap() {
        team2HistoryBtnCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
