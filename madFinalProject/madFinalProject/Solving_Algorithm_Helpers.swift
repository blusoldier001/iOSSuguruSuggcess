//
//  Solving_Algorithm_Helpers.swift
//  madFinalProject
//
//  Created by Jeremy Ouyang on 12/4/22.
//

import Foundation

class cellGroup {
    var intsInGroup:[Int] // Existing numbers in group
    var groupMaxSize:Int! // Max group size
    init(intsInGroup:[Int],groupMaxSize:Int){
        self.intsInGroup = intsInGroup
        self.groupMaxSize = groupMaxSize
    }
    
}
//var allGroups:[cellGroup] = []
//var gameboardsize = 5


func checksurroundings(inputCell:Cell,gameboard:[Cell],gameboardsize:Int) -> Bool{ // Returns TRUE if none of the adjacent cells are the same
    let diagCorrect = checkdiagonal(inputCell:inputCell, gameboard:gameboard,gameboardsize: gameboardsize)
    let sidesCorrect = checksides(inputCell:inputCell, gameboard:gameboard,gameboardsize: gameboardsize)
    return diagCorrect && sidesCorrect
}

func checkdiagonal(inputCell:Cell, gameboard:[Cell],gameboardsize:Int) -> Bool{
    var topright = true
    var topleft = true
    var bottomright = true
    var bottomleft = true
    if(inputCell.xPos + 1 < gameboardsize && inputCell.yPos - 1 >= 0){
      let toprightcoord = (inputCell.yPos - 1 ) * gameboardsize + inputCell.xPos + 1
      let toprightcell = gameboard[toprightcoord]
        topright = compareCells(ogCell:inputCell, cell2:toprightcell)
    }
    if(inputCell.xPos - 1 >= 0 && inputCell.yPos - 1 >= 0){
      let topleftcoord = (inputCell.yPos - 1 ) * gameboardsize + inputCell.xPos - 1
      let topleftcell = gameboard[topleftcoord]
        topleft = compareCells(ogCell:inputCell, cell2:topleftcell)
    }
    if(inputCell.xPos + 1 < gameboardsize && inputCell.yPos + 1 < gameboardsize){
      let bottomrightcoord = (inputCell.yPos + 1 ) * gameboardsize + inputCell.xPos + 1
      let bottomrightcell = gameboard[bottomrightcoord]
        bottomright = compareCells(ogCell:inputCell, cell2:bottomrightcell)
    }
    if(inputCell.xPos - 1 >= 0 && inputCell.yPos + 1 < gameboardsize){
      let bottomleftcoord = (inputCell.yPos + 1 ) * gameboardsize + inputCell.xPos - 1
      let bottomleftcell = gameboard[bottomleftcoord]
        bottomleft = compareCells(ogCell:inputCell, cell2:bottomleftcell)
    }
    return topright && topleft && bottomright && bottomleft
}
func checksides(inputCell:Cell,gameboard:[Cell],gameboardsize:Int) -> Bool{
    var top = true
    var leftSide = true
    var rightSide = true
    var bottom = true
    if(inputCell.xPos + 1 < gameboardsize){
      let rightcoord = (inputCell.yPos) * gameboardsize + inputCell.xPos + 1
      let rightCell = gameboard[rightcoord]
        rightSide = compareCells(ogCell:inputCell, cell2:rightCell)
    }
    if(inputCell.xPos - 1 >= 0){
      let leftcoord = (inputCell.yPos) * gameboardsize + inputCell.xPos - 1
      let leftCell = gameboard[leftcoord]
        leftSide = compareCells(ogCell:inputCell, cell2:leftCell)
    }
    if(inputCell.yPos + 1 < gameboardsize){
      let bottomcoord = (inputCell.yPos + 1 ) * gameboardsize + inputCell.xPos
      let bottomCell = gameboard[bottomcoord]
        bottom = compareCells(ogCell:inputCell, cell2:bottomCell)
    }
    if(inputCell.yPos - 1 >= 0){
      let topcoord = (inputCell.yPos - 1) * gameboardsize + inputCell.xPos
      let topcell = gameboard[topcoord]
        top = compareCells(ogCell:inputCell, cell2:topcell)
    }
    return top && rightSide && leftSide && bottom
}

func compareCells(ogCell:Cell, cell2:Cell) -> Bool{ // Returns FALSE if the cell numbers are the same
    if(ogCell.trueValue! == cell2.trueValue!){
        return false
    }
    return true
}


func solve(gameboard:[Cell],gameboardsize:Int,allGroups:[cellGroup]){
    var index = 0
    let maxindex = (gameboardsize * gameboardsize)
    var invalidSetup = false

    while(index < maxindex){
        var continueLoop = false
        var currentCell:Cell = gameboard[index]

        if(currentCell.changeable == false){
            index = index + 1
            continue
        }
        var currentInt = currentCell.trueValue!
        let currentGroup = allGroups[currentCell.group! - 1]
        let groupsize = currentGroup.groupMaxSize!
        while (currentInt <= groupsize){ // checks if there are no conflicts with adjacent cells and if the number is not in the group
            if(currentInt == 0){
                currentInt = 1
            }
            currentCell.trueValue = currentInt

            if(!(currentGroup.intsInGroup.contains(currentInt)) && checksurroundings(inputCell:currentCell,gameboard:gameboard, gameboardsize: gameboardsize)){

                
                currentGroup.intsInGroup.append(currentInt)
                index = index + 1
                continueLoop = true
                break
            }
            currentInt = currentInt + 1
        }
        if(continueLoop == true){
            continue
        }
        // at this point, if still in this iteration of the loop, that means no possible number was found. in this case we must move back.
        currentCell.trueValue = 0
        var backwardsIndex = index - 1
        while(backwardsIndex >= 0){ //iterate backwards until we find the previous changeable index.
            
            if(gameboard[backwardsIndex].changeable == false){
                backwardsIndex = backwardsIndex - 1
            }
            if(gameboard[backwardsIndex].changeable == true){
                index = backwardsIndex
                let backwardsCell = gameboard[index]
                backwardsCell.trueValue = backwardsCell.trueValue! + 1
                allGroups[backwardsCell.group! - 1].intsInGroup.removeLast() // Since we're appending values each time, the last value in the group numbers list should always be the most recent cell.
                continueLoop = true
                break
            }
        }
        if(continueLoop == true){
            continue
        }
        invalidSetup = true // If reach this phase, that means we've backtracked all the way until the very beginning, meaning there
                            // is no solution.
        break
    }
}






