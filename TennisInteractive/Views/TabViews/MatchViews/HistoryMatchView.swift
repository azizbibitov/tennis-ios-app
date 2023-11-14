//
//  HistoryMatchesView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 02.11.2022.
//

import UIKit
import EasyPeasy

class HistoryMatchView: UIView {
    
    let backgroundView = TabViewsBackground()
    
    let topView = TopView()
    
    var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.backgroundColor = .none
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.isScrollEnabled = false
        tb.register(HistoryMatchCell.self, forCellReuseIdentifier: "historyMatchCell")
        return tb
    }()
    
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
            Trailing()
        ])
        
        backgroundView.addSubview(tableView)
        tableView.easy.layout([
            Top().to(topView, .bottom),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
    }
    
    @objc func backImageTap() {
        backImageCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
