
//
//  GameCell.swift
//  madFinalProject
//
//  Created by Philip Membrino on 11/13/22.
//

import Foundation
import UIKit

class Cell {
    var xPos:Int!
    var yPos:Int!
    var value:Int?
    var group:Int!
    var trueValue:Int!
    var changeable:Bool!
    init(xPos:Int,yPos:Int,value:Int,group:Int,trueValue:Int,changeable:Bool){
        self.xPos = xPos
        self.yPos = yPos
        self.value = value
        self.group = group
        self.trueValue = trueValue
        self.changeable = changeable
    }
    
}

class GameCell: UICollectionViewCell {
    
    var editable = true
    @IBOutlet weak var square_value: UITextField!
    
}

class GameCellTwo: UICollectionViewCell {
    var myLabel=UILabel()
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x:5,y:contentView.frame.size.height-50,width:contentView.frame.size.width-10,height:50)
    }
    
    
}

//Game 1:

//let cell1 = Cell()

