//
//  StatisticMatch.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 02.11.2022.
//

import UIKit

class StatisticMatchVC: UIViewController {
    
    var mainView: StatisticMatchView {
        return view as! StatisticMatchView
    }
    
    override func loadView() {
        super.loadView()
        
        view = StatisticMatchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView.backImageCallback = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
    }
    
}
