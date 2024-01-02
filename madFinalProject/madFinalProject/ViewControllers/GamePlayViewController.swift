//
//  GamePlayViewController.swift
//  madFinalProject
//
//  Created by Jeremy Ouyang on 11/26/22.
//

import Foundation
import UIKit

class GamePlayViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var difficulty:Int!
    var rowSize:CGFloat!
    var game_board:[Int]!
    var game_groups:[Int]!
    var gameCollectionView: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if difficulty == 1 {
            rowSize = 5.0
            return 25
        }
        else if difficulty == 2{
            rowSize = 6.0
            return 36
        }
        else {
            rowSize = 8.0
            return 64
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gameCollectionView!.dequeueReusableCell(withReuseIdentifier: "GameCellTwo", for: indexPath)
        print("cell")
        guard let cell_new = cell as? GameCellTwo
        else{
            return cell
        }
        let value = game_board[indexPath.item]
        if value != 0 {
            cell_new.myLabel.text = "\(value)"
        }
        else {
            cell_new.myLabel.text = ""
        }
        
        switch game_groups[indexPath.item]{
        case 1:
            cell_new.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        case 2:
            cell_new.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        case 3:
            cell_new.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        case 4:
            cell_new.backgroundColor = UIColor.cyan.withAlphaComponent(0.5)
        case 5:
            cell_new.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.5)
        case 6:
            cell_new.backgroundColor = UIColor.systemMint.withAlphaComponent(0.5)
        case 7:
            cell_new.backgroundColor = UIColor.systemPink.withAlphaComponent(0.5)
        case 8:
            cell_new.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.5)
        case 9:
            cell_new.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        case 10:
            cell_new.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        case 11:
            cell_new.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        case 12:
            cell_new.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        default:
            cell_new.backgroundColor = UIColor.white
            
        }
        cell_new.layer.borderColor = UIColor(named: "CellBoarder")?.cgColor
        cell_new.layer.borderWidth = 1
        
            return cell_new
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = gameCollectionView!.frame.width/rowSize
        let height = width
            return CGSize(width: width, height: height)
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let layout = UICollectionViewLayout()
        //This might be wrong
        gameCollectionView = UICollectionView(frame:.zero,collectionViewLayout: layout)
        
        guard let gameCollectionView = gameCollectionView else {
            return
        }
        gameCollectionView.register(GameCellTwo.self, forCellWithReuseIdentifier: "GameCellTwo")
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        gameCollectionView.frame = view.bounds
        view.addSubview(gameCollectionView)
        print(difficulty!)
        print(rowSize!)
        print(game_board!)
        print(game_groups!)
    }
}
