//
//  HistoryMatches.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 02.11.2022.
//

import UIKit

class HistoryMatchVC: UIViewController {
    
    let history_match_data = HistoryMatchData().get_data
    
    var mainView: HistoryMatchView {
        return view as! HistoryMatchView
    }
    
    override func loadView() {
        super.loadView()
        
        view = HistoryMatchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainView.backImageCallback = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        
        
    }
    

    
    
}

extension HistoryMatchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history_match_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyMatchCell", for: indexPath) as! HistoryMatchCell
        cell.configure(data: history_match_data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StatisticMatchVC()
        vc.mainView.topView.pageTitleLabel.text = "Statistic match"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


