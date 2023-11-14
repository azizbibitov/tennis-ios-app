//
//  MatchView.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit
import EasyPeasy

class MatchViev: UIView {
    
    let backgroundView = TabViewsBackground()

    
    var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.backgroundColor = .none
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.register(MatchCell.self, forCellReuseIdentifier: "matchCell")
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundView)
        backgroundView.easy.layout([
            Top(),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
      
        
        backgroundView.addSubview(tableView)
        tableView.easy.layout([
            Top().to(safeAreaLayoutGuide, .top),
            Leading(),
            Trailing(),
            Bottom()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
