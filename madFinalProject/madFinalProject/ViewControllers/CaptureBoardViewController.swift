//
//  CaptureBoardViewController.swift
//  madFinalProject
//
//  Created by Curtis Hung on 12/1/22.
//

import UIKit

class CaptureBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    private var solved = false
    private var game_board_cells: [Cell] = []
    private var rowSize = 5.0;
    private var difficulty = 1;
    
    @IBOutlet weak var failMessage: UILabel!
    @IBOutlet weak var GameCollectionView: UICollectionView!
    
     func run_algorithm() {
        var totalGroups:Int = 0
        for cell in game_board_cells{
            totalGroups = max(totalGroups, cell.group)
        }
        
        var count_array: [Int] = Array(repeating: 0, count: totalGroups)
        var initialGroups: [[Int]] = Array(repeating: Array(), count: totalGroups)
        
        for cell in game_board_cells{
            count_array[cell.group-1] += 1
            if cell.value != 0 {
                initialGroups[cell.group-1].append(cell.value!)
            }
        }
        var allGroups:[cellGroup] = []
        for i in 1...totalGroups{
            allGroups.append(cellGroup(intsInGroup: initialGroups[i-1], groupMaxSize: count_array[i-1]))
        }
        solve(gameboard: game_board_cells, gameboardsize: Int(rowSize), allGroups: allGroups)
        
    }
    
    @IBAction func checkAnswer(_ sender: Any) {
        if !solved {
            run_algorithm()
            solved = true
        }
       
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                failMessage.text = "You Failed!"
                return
            }
        }
        failMessage.text = "Success!"
    }
    @IBAction func solve_button(_ sender: Any) {
        if !solved {
            run_algorithm()
            solved = true
        }
        
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                cell.value = cell.trueValue
            }
        }
        GameCollectionView.reloadData()
        
    }
    @IBAction func hint_button(_ sender: Any) {
        if !solved {
            run_algorithm()
            solved = true
        }
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                cell.value=cell.trueValue
                GameCollectionView.reloadData()
                return
            }
        }
        
    }
    @IBAction func clear_button(_ sender: Any) {
        run_algorithm()
        for cell in game_board_cells{
            if cell.changeable {
                cell.value=0
            }
        }
        GameCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let point : CGPoint = textField.convert(CGPoint(x: 30, y: 0), to: GameCollectionView)
        
        let indexPath:IndexPath? = GameCollectionView.indexPathForItem(at: point)
        
        var index = 0
        if indexPath != nil {
            index = indexPath!.item
        }
        game_board_cells[index].value = Int(textField.text!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath)
        guard let cell_new = cell as? GameCell
        else{
            return cell
        }
        
        cell_new.square_value.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        let value = game_board_cells[indexPath.item].value!
        cell_new.square_value.isUserInteractionEnabled = game_board_cells[indexPath.item].changeable
        if value != 0 {
            cell_new.square_value.text = "\(String(describing: value))"
            //cell_new.editable = false
            
        }
        else {
            
            cell_new.square_value.text = ""
        }
        
        switch game_board_cells[indexPath.item].group!{
        case 1:
            cell_new.backgroundColor = .red.withAlphaComponent(0.5)
        case 2:
            cell_new.backgroundColor = .blue.withAlphaComponent(0.5)
        case 3:
            cell_new.backgroundColor = .green.withAlphaComponent(0.5)
        case 4:
            cell_new.backgroundColor = .cyan.withAlphaComponent(0.5)
        case 5:
            cell_new.backgroundColor = .systemBrown.withAlphaComponent(0.5)
        case 6:
            cell_new.backgroundColor = .systemMint.withAlphaComponent(0.5)
        case 7:
            cell_new.backgroundColor = .systemPink.withAlphaComponent(0.5)
        case 8:
            cell_new.backgroundColor = .systemPurple.withAlphaComponent(0.5)
        case 9:
            cell_new.backgroundColor = .yellow.withAlphaComponent(0.5)
        case 10:
            cell_new.backgroundColor = .purple.withAlphaComponent(0.5)
        case 11:
            cell_new.backgroundColor = .lightGray.withAlphaComponent(0.5)
        case 12:
            cell_new.backgroundColor = .gray.withAlphaComponent(0.5)
        case 13:
            cell_new.backgroundColor = .systemTeal.withAlphaComponent(0.5)
        case 14:
            cell_new.backgroundColor = .systemCyan.withAlphaComponent(0.5)
        case 15:
            cell_new.backgroundColor = .systemIndigo.withAlphaComponent(0.5)
        default:
            cell_new.backgroundColor = .white
            
        }
        cell_new.layer.borderColor = UIColor(named: "CellBoarder")?.cgColor
        cell_new.layer.borderWidth = 1
        
            return cell_new
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/rowSize
        let height = width
            return CGSize(width: width, height: height)
        }
    
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
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        GameCollectionView.dataSource = self
        GameCollectionView.delegate = self
        game_board_cells = game_board_cells_image //Put the captured board here
        if game_board_cells_image.count < 30 {
            difficulty = 1
        }
        if game_board_cells_image.count > 30 && game_board_cells_image.count < 40 {
            difficulty = 2
            
        }
        if game_board_cells_image.count > 40 && game_board_cells_image.count < 70 {
            difficulty = 3
            
        }

        self.GameCollectionView.reloadData()
        
    
        //must set difficulty and row size
        
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
