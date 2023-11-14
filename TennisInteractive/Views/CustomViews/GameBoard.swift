//
//  GameBoard.swift
//  TennisInteractive
//
//  Created by Aziz's MacBook Air on 03.11.2022.
//

import UIKit
import EasyPeasy


class GameBoard: UIView {
    
    var vertical2Lines: Vertical2Lines = {
        let board = Vertical2Lines()
        board.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return board
    }()
    
    var horizontal2Lines: Horizontal2Lines = {
        let board = Horizontal2Lines()
        board.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return board
    }()

    
    var num11: UILabel = {
        let lbl = UILabel()
        lbl.text = "1"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .ticTacToeNumberColor
        return lbl
    }()
    
    var num12: UILabel = {
        let lbl = UILabel()
        lbl.text = "2"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .ticTacToeNumberColor
        return lbl
    }()
    
    var num13: UILabel = {
        let lbl = UILabel()
        lbl.text = "3"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .ticTacToeNumberColor
        return lbl
    }()
    
    var num21: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .white
        return lbl
    }()
    
    var num22: UILabel = {
        let lbl = UILabel()
        lbl.text = "6"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .white
        return lbl
    }()
    
    var num23: UILabel = {
        let lbl = UILabel()
        lbl.text = "5"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .systemGreen
        return lbl
    }()
    
    var num31: UILabel = {
        let lbl = UILabel()
        lbl.text = "3"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .white
        return lbl
    }()
    
    var num32: UILabel = {
        let lbl = UILabel()
        lbl.text = "4"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .white
        return lbl
    }()
    
    var num33: UILabel = {
        let lbl = UILabel()
        lbl.text = "7"
        lbl.font = lbl.font.withSize(15)
        lbl.textColor = .systemGreen
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(vertical2Lines)
        vertical2Lines.easy.layout([
            Edges()
        ])
        
        addSubview(horizontal2Lines)
        horizontal2Lines.easy.layout([
            Edges()
        ])
        
        addSubview(num11)
        num11.easy.layout([
            Top(),
            Leading(5)
        ])
        
        addSubview(num12)
        num12.easy.layout([
            Top(),
            CenterX()
        ])
        
        addSubview(num13)
        num13.easy.layout([
            Top(),
            Trailing(5)
        ])
        
        addSubview(num21)
        num21.easy.layout([
            Leading(5),
            CenterY()
        ])
       
        addSubview(num22)
        num22.easy.layout([
            Center()
        ])
        
        addSubview(num23)
        num23.easy.layout([
            Trailing(5),
            CenterY()
        ])
        
        addSubview(num31)
        num31.easy.layout([
            Leading(5),
            Bottom()
        ])
        
        addSubview(num32)
        num32.easy.layout([
            CenterX(),
            Bottom()
        ])
        
        addSubview(num33)
        num33.easy.layout([
            Trailing(5),
            Bottom()
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


@IBDesignable class Horizontal2Lines: UIView {
    
    override func draw(_ rect: CGRect) {
        setUpGameBoardCells()
        
        UIColor.white.setStroke()
        
        var divider = UIBezierPath(rect: CGRect(x: 0, y: cellWidth, width: bounds.size.width, height: dividerWidth))
        divider.lineWidth = 2
        divider.stroke()
        
        divider = UIBezierPath(rect: CGRect(x: 0, y: cellWidth * 2 + dividerWidth, width: bounds.size.width, height: dividerWidth))
        divider.lineWidth = 2
        divider.stroke()
    }
    
    let cellsPerRow = 3
    let dividerWidthGuide: CGFloat = 0.02   // guideline % of gameBoardLength
    
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var dividerWidth: CGFloat!
    
    func setUpGameBoardCells() {
        let gameBoardLength = min(bounds.size.height, bounds.size.width)
        dividerWidth = round(gameBoardLength * dividerWidthGuide)
        let cellsTotalWidth: Int = Int(gameBoardLength) - Int(dividerWidth) * (cellsPerRow - 1)
        let dividerWidthFudge: CGFloat = (cellsTotalWidth % cellsPerRow == 1 ? -1 : (cellsTotalWidth % cellsPerRow == 2 ? 1 : 0))
        dividerWidth! += dividerWidthFudge
        cellWidth = CGFloat(Int(cellsTotalWidth - Int(dividerWidthFudge) * (cellsPerRow - 1)) / cellsPerRow)
    }
    
}


@IBDesignable class Vertical2Lines: UIView {
    
    override func draw(_ rect: CGRect) {
        setUpGameBoardCells()
        
        UIColor.white.setStroke()
        
        var divider = UIBezierPath(rect: CGRect(x: cellWidth, y: 0, width: dividerWidth, height: bounds.size.height))
        divider.lineWidth = 2
        divider.stroke()
        
        divider = UIBezierPath(rect: CGRect(x: cellWidth * 2 + dividerWidth, y: 0, width: dividerWidth, height: bounds.size.height))
        divider.lineWidth = 2
        divider.stroke()
    }
    
    let cellsPerRow = 3
    let dividerWidthGuide: CGFloat = 0.02   // guideline % of gameBoardLength
    
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var dividerWidth: CGFloat!
    
    func setUpGameBoardCells() {
        let gameBoardLength = min(bounds.size.height, bounds.size.width)
        dividerWidth = round(gameBoardLength * dividerWidthGuide)
        let cellsTotalWidth: Int = Int(gameBoardLength) - Int(dividerWidth) * (cellsPerRow - 1)
        let dividerWidthFudge: CGFloat = (cellsTotalWidth % cellsPerRow == 1 ? -1 : (cellsTotalWidth % cellsPerRow == 2 ? 1 : 0))
        dividerWidth! += dividerWidthFudge
        cellWidth = CGFloat((cellsTotalWidth - Int(dividerWidthFudge) * (cellsPerRow - 1)) / cellsPerRow)
    }
    
}
