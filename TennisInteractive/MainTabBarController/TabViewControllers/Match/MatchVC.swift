//
//  MatchVC.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit
import EasyPeasy

class MatchVC: UIViewController, UIGestureRecognizerDelegate {
    
    let match_data = MatchData().get_data
    
    var mainView: MatchViev {
        return view as! MatchViev
    }
    
    override func loadView() {
        super.loadView()
        
        view = MatchViev()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    
    
}

extension MatchVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return match_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
        cell.selectionStyle = .none
        cell.configure(data: match_data[indexPath.row])
        
        cell.team1HistoryBtnCallback = { [weak self] in
            let vc = HistoryMatchVC()
            vc.mainView.topView.pageTitleLabel.text = "History match"
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.team2HistoryBtnCallback = { [weak self] in
            let vc = HistoryMatchVC()
            vc.mainView.topView.pageTitleLabel.text = "History match"
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
   
    
    
}
