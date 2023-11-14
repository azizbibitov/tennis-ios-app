//
//  BetCell.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 11.11.2022.
//

import UIKit
import EasyPeasy

class BetCell: UITableViewCell {
    
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
    
    var dateAndTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(11)
        lbl.textAlignment = .center
        lbl.text = "22:22"
        return lbl
    }()
    
    var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Inter-Black", size: 20)
        lbl.textAlignment = .center
        lbl.textColor = .matchTimeGoldColor
        lbl.text = "15 oct"
        
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
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white.withAlphaComponent(0.0)
   
        
        self.contentView.addSubview(matchDetailsLayerWithRounderBack)
        matchDetailsLayerWithRounderBack.easy.layout([
            Top(10),
            Leading(10),
            Trailing(10),
            Height(80),
            Bottom(10)
        ])
        
        setupCellLayerViews()
        
    }
    
    func setupCellLayerViews() {
   
        
        VStackInCenter.VStack(
            dateAndTimeLabel,
            scoreLabel,
            spacing: 5
        )
        .padding([.horizontalMargins], amount: 2)
        
        matchDetailsLayerWithRounderBack.addSubview(VStackInCenter)
        VStackInCenter.easy.layout([
            Center()
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(image1)
        image1.easy.layout([
            CenterY().to(VStackInCenter, .centerY),
            Trailing(5).to(VStackInCenter, .leading)
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
            Leading(5).to(VStackInCenter, .trailing)
        ])
        
        matchDetailsLayerWithRounderBack.addSubview(name2Label)
        name2Label.easy.layout([
            CenterY().to(image2, .centerY),
            Leading(10).to(image2, .trailing),
            Trailing().to(matchDetailsLayerWithRounderBack, .trailing)
        ])
        
        image1.easy.layout([Height(50), Width(50)])
        image2.easy.layout([Height(50), Width(50)])
        
        
        
        
        
    }
    
    func configure(data: HistoryMatchModel){
        
        name1Label.text = data.name1
        name2Label.text = data.name2
        image1.image = UIImage(named: data.image1)
        image2.image = UIImage(named: data.image2)
        dateAndTimeLabel.text = "\(data.date) | \(data.time)"
        scoreLabel.text = data.score
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
