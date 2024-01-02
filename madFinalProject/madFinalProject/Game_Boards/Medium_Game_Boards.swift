
//
//  Medium_Game_Boards.swift
//  madFinalProject
//
//  Created by Jeremy Ouyang on 11/28/22.
//

import Foundation

var Medium_Board_One:[Cell] = [
    Cell(xPos:0,yPos:0,value:0,group:1,trueValue:1,changeable:true),
    Cell(xPos:1,yPos:0,value:0,group:1,trueValue:5,changeable:true),
    Cell(xPos:2,yPos:0,value:3,group:1,trueValue:3,changeable:false),
    Cell(xPos:3,yPos:0,value:0,group:2,trueValue:4,changeable:true),
    Cell(xPos:4,yPos:0,value:0,group:2,trueValue:3,changeable:true),
    Cell(xPos:5,yPos:0,value:1,group:2,trueValue:1,changeable:false),
    
    Cell(xPos:0,yPos:1,value:4,group:1,trueValue:4,changeable:false),
    Cell(xPos:1,yPos:1,value:0,group:1,trueValue:2,changeable:true),
    Cell(xPos:2,yPos:1,value:0,group:3,trueValue:1,changeable:true),
    Cell(xPos:3,yPos:1,value:0,group:3,trueValue:2,changeable:true),
    Cell(xPos:4,yPos:1,value:0,group:2,trueValue:5,changeable:true),
    Cell(xPos:5,yPos:1,value:0,group:2,trueValue:2,changeable:true), // Change later
    
    Cell(xPos:0,yPos:2,value:0,group:4,trueValue:3,changeable:true),
    Cell(xPos:1,yPos:2,value:0,group:4,trueValue:5,changeable:true),
    Cell(xPos:2,yPos:2,value:0,group:5,trueValue:3,changeable:true),
    Cell(xPos:3,yPos:2,value:4,group:5,trueValue:4,changeable:false),
    Cell(xPos:4,yPos:2,value:0,group:5,trueValue:1,changeable:true),
    Cell(xPos:5,yPos:2,value:0,group:6,trueValue:3,changeable:true),
    
    Cell(xPos:0,yPos:3,value:0,group:4,trueValue:1,changeable:true),
    Cell(xPos:1,yPos:3,value:0,group:4,trueValue:2,changeable:true),
    Cell(xPos:2,yPos:3,value:0,group:7,trueValue:1,changeable:true),
    Cell(xPos:3,yPos:3,value:0,group:5,trueValue:2,changeable:true),
    Cell(xPos:4,yPos:3,value:0,group:6,trueValue:5,changeable:true),
    Cell(xPos:5,yPos:3,value:2,group:6,trueValue:2,changeable:false),
    
    Cell(xPos:0,yPos:4,value:4,group:4,trueValue:4,changeable:false),
    Cell(xPos:1,yPos:4,value:0,group:7,trueValue:3,changeable:true),
    Cell(xPos:2,yPos:4,value:5,group:7,trueValue:5,changeable:false),
    Cell(xPos:3,yPos:4,value:0,group:7,trueValue:4,changeable:true),
    Cell(xPos:4,yPos:4,value:0,group:8,trueValue:3,changeable:true),
    Cell(xPos:5,yPos:4,value:1,group:6,trueValue:1,changeable:false),
    
    Cell(xPos:0,yPos:5,value:0,group:9,trueValue:2,changeable:true),
    Cell(xPos:1,yPos:5,value:0,group:9,trueValue:1,changeable:true),
    Cell(xPos:2,yPos:5,value:2,group:7,trueValue:2,changeable:false),
    Cell(xPos:3,yPos:5,value:0,group:8,trueValue:1,changeable:true),
    Cell(xPos:4,yPos:5,value:0,group:8,trueValue:2,changeable:true),
    Cell(xPos:5,yPos:5,value:0,group:6,trueValue:4,changeable:true)]

var Medium_Board_Two:[Cell] =
                            [Cell(xPos:0,yPos:0,value:3,group:1,trueValue:3,changeable:false),Cell(xPos:1,yPos:0,value:0,group:1,trueValue:4,changeable:true), Cell(xPos:2,yPos:0,value:0,group:2,trueValue:1,changeable:true),Cell(xPos:3,yPos:0,value:0,group:3,trueValue:2,changeable:true), Cell(xPos:4,yPos:0,value:0,group:3,trueValue:1,changeable:true),Cell(xPos:5,yPos:0,value:0,group:3,trueValue:4,changeable:true),
                             
                               Cell(xPos:0,yPos:1,value:0,group:1,trueValue:1,changeable:true),Cell(xPos:1,yPos:1,value:0,group:2,trueValue:2,changeable:true), Cell(xPos:2,yPos:1,value:0,group:2,trueValue:3,changeable:true),Cell(xPos:3,yPos:1,value:4,group:2,trueValue:4,changeable:false), Cell(xPos:4,yPos:1,value:0,group:3,trueValue:3,changeable:true), Cell(xPos:5,yPos:1,value:0,group:4,trueValue:2,changeable:true),
                             
                                Cell(xPos:0,yPos:2,value:5,group:1,trueValue:5,changeable:false),Cell(xPos:1,yPos:2,value:0,group:5,trueValue:4,changeable:true), Cell(xPos:2,yPos:2,value:0,group:2,trueValue:5,changeable:true),Cell(xPos:3,yPos:2,value:0,group:6,trueValue:1,changeable:true), Cell(xPos:4,yPos:2,value:0,group:3,trueValue:5,changeable:true),Cell(xPos:5,yPos:2,value:4,group:4,trueValue:4,changeable:false),
                             
                             Cell(xPos:0,yPos:3,value:0,group:1,trueValue:2,changeable:true),Cell(xPos:1,yPos:3,value:0,group:5,trueValue:1,changeable:true), Cell(xPos:2,yPos:3,value:2,group:5,trueValue:2,changeable:false),Cell(xPos:3,yPos:3,value:3,group:6,trueValue:3,changeable:false), Cell(xPos:4,yPos:3,value:0,group:6,trueValue:2,changeable:true),Cell(xPos:5,yPos:3,value:0,group:4,trueValue:1,changeable:true),
                             
                               Cell(xPos:0,yPos:4,value:5,group:7,trueValue:5,changeable:false),Cell(xPos:1,yPos:4,value:0,group:5,trueValue:3,changeable:true), Cell(xPos:2,yPos:4,value:0,group:5,trueValue:5,changeable:true),Cell(xPos:3,yPos:4,value:0,group:6,trueValue:4,changeable:true), Cell(xPos:4,yPos:4,value:0,group:6,trueValue:5,changeable:true),Cell(xPos:5,yPos:4,value:0,group:4,trueValue:3,changeable:true),
                             
                             Cell(xPos:0,yPos:5,value:1,group:7,trueValue:1,changeable:false),Cell(xPos:1,yPos:5,value:0,group:7,trueValue:4,changeable:true), Cell(xPos:2,yPos:5,value:0,group:7,trueValue:2,changeable:true),Cell(xPos:3,yPos:5,value:0,group:7,trueValue:3,changeable:true), Cell(xPos:4,yPos:5,value:2,group:8,trueValue:2,changeable:false),Cell(xPos:5,yPos:5,value:0,group:8,trueValue:1,changeable:true)]




var Medium_Board_Three:[Cell] =
                            [Cell(xPos:0,yPos:0,value:1,group:1,trueValue:1,changeable:false),Cell(xPos:1,yPos:0,value:0,group:1,trueValue:4,changeable:true), Cell(xPos:2,yPos:0,value:0,group:2,trueValue:1,changeable:true),Cell(xPos:3,yPos:0,value:3,group:2,trueValue:3,changeable:false), Cell(xPos:4,yPos:0,value:0,group:3,trueValue:2,changeable:true),Cell(xPos:5,yPos:0,value:1,group:3,trueValue:1,changeable:true),
                             
                               Cell(xPos:0,yPos:1,value:0,group:1,trueValue:5,changeable:true),Cell(xPos:1,yPos:1,value:0,group:1,trueValue:3,changeable:true), Cell(xPos:2,yPos:1,value:0,group:2,trueValue:2,changeable:true),Cell(xPos:3,yPos:1,value:0,group:2,trueValue:4,changeable:true), Cell(xPos:4,yPos:1,value:0,group:3,trueValue:5,changeable:true), Cell(xPos:5,yPos:1,value:0,group:3,trueValue:3,changeable:true),
                             
                             Cell(xPos:0,yPos:2,value:2,group:1,trueValue:2,changeable:false),Cell(xPos:1,yPos:2,value:4,group:4,trueValue:4,changeable:false), Cell(xPos:2,yPos:2,value:0,group:2,trueValue:5,changeable:true),Cell(xPos:3,yPos:2,value:0,group:5,trueValue:1,changeable:true), Cell(xPos:4,yPos:2,value:0,group:5,trueValue:2,changeable:true),Cell(xPos:5,yPos:2,value:0,group:3,trueValue:4,changeable:true),
                             
                             Cell(xPos:0,yPos:3,value:0,group:4,trueValue:3,changeable:true),Cell(xPos:1,yPos:3,value:0,group:4,trueValue:1,changeable:true), Cell(xPos:2,yPos:3,value:0,group:6,trueValue:2,changeable:true),Cell(xPos:3,yPos:3,value:0,group:6,trueValue:4,changeable:true), Cell(xPos:4,yPos:3,value:0,group:6,trueValue:3,changeable:true),Cell(xPos:5,yPos:3,value:0,group:7,trueValue:5,changeable:true),
                             
                               Cell(xPos:0,yPos:4,value:0,group:4,trueValue:2,changeable:true),Cell(xPos:1,yPos:4,value:0,group:4,trueValue:5,changeable:true), Cell(xPos:2,yPos:4,value:3,group:8,trueValue:3,changeable:false),Cell(xPos:3,yPos:4,value:0,group:6,trueValue:1,changeable:true), Cell(xPos:4,yPos:4,value:2,group:7,trueValue:2,changeable:false),Cell(xPos:5,yPos:4,value:0,group:7,trueValue:4,changeable:true),
                             
                             Cell(xPos:0,yPos:5,value:1,group:8,trueValue:1,changeable:false),Cell(xPos:1,yPos:5,value:0,group:8,trueValue:4,changeable:true), Cell(xPos:2,yPos:5,value:0,group:8,trueValue:2,changeable:true),Cell(xPos:3,yPos:5,value:0,group:8,trueValue:5,changeable:true), Cell(xPos:4,yPos:5,value:0,group:7,trueValue:3,changeable:true),Cell(xPos:5,yPos:5,value:1,group:7,trueValue:1,changeable:false)]

var Medium_Board_Four:[Cell] =
                            [Cell(xPos:0,yPos:0,value:0,group:1,trueValue:3,changeable:true),Cell(xPos:1,yPos:0,value:2,group:1,trueValue:2,changeable:false), Cell(xPos:2,yPos:0,value:0,group:2,trueValue:3,changeable:true),Cell(xPos:3,yPos:0,value:4,group:2,trueValue:4,changeable:false), Cell(xPos:4,yPos:0,value:0,group:2,trueValue:1,changeable:true),Cell(xPos:5,yPos:0,value:0,group:2,trueValue:2,changeable:true),
                             
                               Cell(xPos:0,yPos:1,value:0,group:1,trueValue:5,changeable:true),Cell(xPos:1,yPos:1,value:0,group:1,trueValue:1,changeable:true), Cell(xPos:2,yPos:1,value:0,group:2,trueValue:5,changeable:true),Cell(xPos:3,yPos:1,value:0,group:3,trueValue:2,changeable:true), Cell(xPos:4,yPos:1,value:0,group:4,trueValue:5,changeable:true), Cell(xPos:4,yPos:1,value:0,group:4,trueValue:4,changeable:true),
                             
                             Cell(xPos:0,yPos:2,value:0,group:1,trueValue:4,changeable:true),Cell(xPos:1,yPos:2,value:0,group:5,trueValue:3,changeable:true), Cell(xPos:2,yPos:2,value:0,group:3,trueValue:4,changeable:true),Cell(xPos:3,yPos:2,value:0,group:3,trueValue:1,changeable:true), Cell(xPos:4,yPos:2,value:3,group:3,trueValue:3,changeable:false),Cell(xPos:5,yPos:2,value:0,group:4,trueValue:2,changeable:true),
                             
                             Cell(xPos:0,yPos:3,value:1,group:5,trueValue:1,changeable:false),Cell(xPos:1,yPos:3,value:0,group:5,trueValue:5,changeable:true), Cell(xPos:2,yPos:3,value:0,group:6,trueValue:2,changeable:true),Cell(xPos:3,yPos:3,value:0,group:3,trueValue:5,changeable:true), Cell(xPos:4,yPos:3,value:0,group:7,trueValue:4,changeable:true),Cell(xPos:5,yPos:3,value:0,group:4,trueValue:1,changeable:true),
                             
                               Cell(xPos:0,yPos:4,value:4,group:5,trueValue:4,changeable:false),Cell(xPos:1,yPos:4,value:0,group:6,trueValue:3,changeable:true), Cell(xPos:2,yPos:4,value:0,group:6,trueValue:4,changeable:true),Cell(xPos:3,yPos:4,value:0,group:6,trueValue:1,changeable:true), Cell(xPos:4,yPos:4,value:0,group:7,trueValue:2,changeable:true),Cell(xPos:5,yPos:4,value:0,group:4,trueValue:3,changeable:true),
                             
                             Cell(xPos:0,yPos:5,value:0,group:5,trueValue:2,changeable:true),Cell(xPos:1,yPos:5,value:2,group:8,trueValue:1,changeable:false), Cell(xPos:2,yPos:5,value:0,group:8,trueValue:2,changeable:true),Cell(xPos:3,yPos:5,value:0,group:7,trueValue:3,changeable:true), Cell(xPos:4,yPos:5,value:0,group:7,trueValue:5,changeable:true),Cell(xPos:5,yPos:5,value:0,group:7,trueValue:1,changeable:true)]


var Medium_Board_Five:[Cell] =
                            [Cell(xPos:0,yPos:0,value:4,group:1,trueValue:4,changeable:false),Cell(xPos:1,yPos:0,value:2,group:1,trueValue:1,changeable:false), Cell(xPos:2,yPos:0,value:0,group:1,trueValue:5,changeable:true),Cell(xPos:3,yPos:0,value:0,group:1,trueValue:2,changeable:true), Cell(xPos:4,yPos:0,value:5,group:2,trueValue:5,changeable:false),Cell(xPos:5,yPos:0,value:0,group:2,trueValue:1,changeable:true),
                             
                               Cell(xPos:0,yPos:1,value:0,group:1,trueValue:3,changeable:true),Cell(xPos:1,yPos:1,value:0,group:3,trueValue:2,changeable:true), Cell(xPos:2,yPos:1,value:0,group:4,trueValue:3,changeable:true),Cell(xPos:3,yPos:1,value:0,group:4,trueValue:1,changeable:true), Cell(xPos:4,yPos:1,value:0,group:2,trueValue:4,changeable:true), Cell(xPos:4,yPos:1,value:0,group:2,trueValue:2,changeable:true),
                             
                             Cell(xPos:0,yPos:2,value:0,group:3,trueValue:1,changeable:true),Cell(xPos:1,yPos:2,value:0,group:3,trueValue:5,changeable:true), Cell(xPos:2,yPos:2,value:0,group:3,trueValue:4,changeable:true),Cell(xPos:3,yPos:2,value:0,group:4,trueValue:5,changeable:true), Cell(xPos:4,yPos:2,value:0,group:2,trueValue:3,changeable:true),Cell(xPos:5,yPos:2,value:0,group:5,trueValue:1,changeable:true),
                             
                             Cell(xPos:0,yPos:3,value:4,group:6,trueValue:4,changeable:false),Cell(xPos:1,yPos:3,value:0,group:3,trueValue:3,changeable:true), Cell(xPos:2,yPos:3,value:0,group:7,trueValue:1,changeable:true),Cell(xPos:3,yPos:3,value:0,group:4,trueValue:2,changeable:true), Cell(xPos:4,yPos:3,value:0,group:4,trueValue:4,changeable:true),Cell(xPos:5,yPos:3,value:2,group:5,trueValue:2,changeable:false),
                             
                               Cell(xPos:0,yPos:4,value:0,group:6,trueValue:2,changeable:true),Cell(xPos:1,yPos:4,value:0,group:7,trueValue:5,changeable:true), Cell(xPos:2,yPos:4,value:0,group:7,trueValue:4,changeable:true),Cell(xPos:3,yPos:4,value:0,group:7,trueValue:3,changeable:true), Cell(xPos:4,yPos:4,value:0,group:5,trueValue:5,changeable:true),Cell(xPos:5,yPos:4,value:0,group:5,trueValue:3,changeable:true),
                             
                             Cell(xPos:0,yPos:5,value:0,group:6,trueValue:3,changeable:true),Cell(xPos:1,yPos:5,value:1,group:6,trueValue:1,changeable:false), Cell(xPos:2,yPos:5,value:0,group:7,trueValue:2,changeable:true),Cell(xPos:3,yPos:5,value:0,group:8,trueValue:1,changeable:true), Cell(xPos:4,yPos:5,value:0,group:8,trueValue:2,changeable:true),Cell(xPos:5,yPos:5,value:0,group:5,trueValue:4,changeable:true)]
