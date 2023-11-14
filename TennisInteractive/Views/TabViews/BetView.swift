//
//  BetView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 07.11.2022.
//
import UIKit
import EasyPeasy



class BetView: UIView {
    
    let backgroundView = TabViewsBackground()
    
    var topView: TopView = {
       let tv = TopView()
        tv.pageTitleLabel.text = "Bet"
        tv.backButton.isHidden = true
        tv.imageTextButton.backgroundView.setCorner(cornerRadius: 10)
        tv.imageTextButton.btnLabel.text = "1336"
        tv.imageTextButton.btnLabel.font = UIFont(name: "Inter-Bold", size: 17)
        tv.imageTextButton.btnLabel.textColor = .coinTextColor
        tv.imageTextButton.btnLabel.easy.layout([
            CenterY(),
            Trailing(),
            Height(20),
            Width(50)
        ])
        tv.imageTextButton.btnImage.image = UIImage(named: "coin")
        tv.imageTextButton.btnImage.contentMode = .scaleAspectFit
        tv.imageTextButton.btnImage.easy.layout([
            CenterY(),
            Trailing().to(tv.imageTextButton.btnLabel, .leading),
            Height(20),
            Width(30)
        ])
        tv.imageTextButton.easy.layout([
            CenterY(),
            Trailing(10),
            Height(35),
            Width(85)
        ])
      
        
        return tv
    }()
    
    //MARK: History Buttons' Views
    var betBtnsLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return view
    }()
    
    var betBtn: UniversalButton = {
        let btn = UniversalButton()
        btn.backgroundView.setCorner(cornerRadius: 20)
        btn.backgroundView.setBorder(borderWidth: 0.3, borderColor: UIColor.black.cgColor)
        btn.backgroundView.setShadow(shadowOpacity: 0.8, shadowRadius: 2.0, shadowOffset: CGSize(width: 0.0, height: 0.0))
        btn.btnLabel.text = "Bet"
        btn.btnLabel.font = UIFont(name: "Inter-Regular", size: 17)
        btn.btnLabel.textAlignment = .center
        btn.btnLabel.easy.layout([
            Center(),
            Height(30),
            Width(95)
        ])
        return btn
    }()
    
    var myBetBtn: UniversalButton = {
        let btn = UniversalButton()
        btn.backgroundView.backgroundColor = .unselectedBtnColor
        btn.backgroundView.setCorner(cornerRadius: 20)
        btn.btnLabel.text = "MyBet"
        btn.btnLabel.textColor = .grayTextColor
        btn.btnLabel.font = UIFont(name: "Inter-Regular", size: 17)
        btn.btnLabel.textAlignment = .center
        btn.btnLabel.easy.layout([
            Center(),
            Height(30),
            Width(95)
        ])
        return btn
    }()
    
    
    var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.backgroundColor = .none
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.register(BetCell.self, forCellReuseIdentifier: "betCell")
        return tb
    }()
    
    var betBtnCallback: ( ()->Void )?
    var myBetBtnCallback: ( ()->Void )?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        betBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(betBtnTap)))
        
        myBetBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(myBetBtnTap)))
        
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
            Trailing()
        ])
        
        backgroundView.addSubview(betBtnsLayer)
        betBtnsLayer.easy.layout([
            Top(10).to(topView, .bottom),
            Leading(10),
            Trailing(10)
        ])
        
        betBtnsLayer.HStack(
            betBtn,
            myBetBtn,
            spacing: 20,
            distribution: .fillEqually
        )
        
        betBtn.easy.layout([Height(40), Width(110)])
        myBetBtn.easy.layout([Height(40), Width(110)])
        
        backgroundView.addSubview(tableView)
        tableView.easy.layout([
            Top(30).to(betBtnsLayer, .bottom),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
    }
    
    @objc func betBtnTap() {
        betBtnCallback?()
    }
    
    @objc func myBetBtnTap() {
        myBetBtnCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
