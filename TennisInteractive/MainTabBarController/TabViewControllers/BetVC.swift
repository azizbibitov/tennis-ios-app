//
//  BetVC.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 31.10.2022.
//

import UIKit

class BetVC: UIViewController {
    
    let history_match_data = HistoryMatchData().get_data
    
    var mainView: BetView {
        return view as! BetView
    }
    
    override func loadView() {
        super.loadView()
        
        view = BetView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        
        mainView.betBtnCallback = { [weak self] in
            
            self?.selectBetBtn(isBetBtnSelected: true)
        }
        
        mainView.myBetBtnCallback = { [weak self] in
            
            self?.selectBetBtn(isBetBtnSelected: false)
        }
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    
    func selectBetBtn(isBetBtnSelected: Bool) {
        
        mainView.betBtn.backgroundView.backgroundColor = isBetBtnSelected ? .roundedBackgroundViewColor : .unselectedBtnColor
        mainView.betBtn.btnLabel.textColor = isBetBtnSelected ? .white : .grayTextColor
        
        mainView.myBetBtn.backgroundView.backgroundColor = !isBetBtnSelected ? .roundedBackgroundViewColor : .unselectedBtnColor
        mainView.myBetBtn.btnLabel.textColor = !isBetBtnSelected ? .white : .grayTextColor
        
        mainView.betBtn.backgroundView.setBorder(borderWidth: isBetBtnSelected ? 0.3 : 0.0, borderColor: UIColor.black.cgColor)
        mainView.betBtn.backgroundView.setShadow(shadowOpacity: isBetBtnSelected ? 0.8 : 0.0, shadowRadius: 2.0, shadowOffset: CGSize(width: 0.0, height: 0.0))
        
        mainView.myBetBtn.backgroundView.setBorder(borderWidth: !isBetBtnSelected ? 0.3 : 0.0, borderColor: UIColor.black.cgColor)
        mainView.myBetBtn.backgroundView.setShadow(shadowOpacity: !isBetBtnSelected ? 0.8 : 0.0, shadowRadius: 2.0, shadowOffset: CGSize(width: 0.0, height: 0.0))
        
    }
    
}


extension BetVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history_match_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath) as! BetCell
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
