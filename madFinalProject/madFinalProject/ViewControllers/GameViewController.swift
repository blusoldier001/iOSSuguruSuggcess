
//
//  GameViewController.swift
//  madFinalProject
//
//  Created by Philip Membrino on 11/11/22.
//

import UIKit


class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBAction func clear_button(_ sender: Any) {
        for cell in game_board_cells{
            if cell.changeable {
                cell.value=0
            }
        }
        GameCollectionView.reloadData()
    }
    
    @IBAction func hint_button(_ sender: Any) {
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                cell.value=cell.trueValue
                GameCollectionView.reloadData()
                return
            }
        }
        
    }
    @IBAction func solve_button(_ sender: Any) {
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                cell.value = cell.trueValue
            }
        }
        GameCollectionView.reloadData()
        
    }
    
    @IBOutlet weak var easyPopUpMenu: UIButton!
    
    @IBOutlet weak var medPopUpMenu: UIButton!
    
    @IBOutlet weak var hardPopUpMenu: UIButton!
    
    private var difficulty = 1;
    
    @IBOutlet weak var failMessage: UILabel!
    private var rowSize = 5.0;
    
    private var game_board_cells: [Cell] = []
    
    private var currentIndexPath:IndexPath?
    
    public var current_board: String = "Easy Puzzle 1"
    
    var didWin = false
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    public var games_won: Int = 0
    public var easy_games_won: Int = 0
    public var medium_games_won: Int = 0
    public var hard_games_won: Int = 0
    
    public var timer_time: CGFloat = 0
    
    var timer = Timer()
        var seconds = 0
        var minutes = 0 //This variable will hold a starting value of seconds. It could be any amount above 0.
        var secondsText = ""
        var minutesText = ""
        var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
        
        func runTimer() {
            if isTimerRunning == false {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self,  selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
                isTimerRunning = true
            }
        }
        @objc func updateTimer() {
            seconds += 1
            if seconds == 60{
                seconds = 0
                minutes += 1
            }
            if seconds < 10 {
                secondsText = "0" + "\(seconds)"
            }
            else{
                secondsText = "\(seconds)"
            }
            
            if minutes < 10 {
                minutesText = "0" + "\(minutes)"
            }
            else{
                minutesText = "\(minutes)"
            }
            timerLabel.text = minutesText + ":" + secondsText
        }
        
        func pauseTimer() {
            timer.invalidate()
            isTimerRunning = false
            
            
//            if self.isTimerRunning == true {
//                 timer.invalidate()
//                 self.isTimerRunning = false
//            } else {
//                 timer.invalidate()
//                 runTimer()
//                 self.isTimerRunning = true
//            }
        }
        
        func restartTimer() {
            
            minutes = 0
            seconds = 0
            minutesText = "00"
            secondsText = "00"
            timerLabel.text = "00:00"
            runTimer()
            isTimerRunning = true
        }

    
    
    public var gamesWonKey = "totalGamesWon"
    public var easyWonKey = "easyGamesWon"
    public var medWonKey = "medGamesWon"
    public var hardWonKey = "hardGamesWon"
    
    public var easySecKey = "easySecKey"
        public var easyMinKey = "easyMinKey"
        public var medSecKey = "medSecKey"
        public var medMinKey = "medMinKey"
        public var hardSecKey = "hardSecKey"
        public var hardMinKey = "hardMinKey"
    
    
    func retrieveLabel( Key: String) -> String {
        guard let encoded = UserDefaults.standard.data(forKey: Key) else { return "0" }
        let label = try! JSONDecoder().decode(Int.self, from: encoded)
        return "\(label)"
    
    }
    
    @IBAction func checkAnswer(_ sender: Any) {
        
        for cell in (game_board_cells) {
            if cell.value != cell.trueValue {
                failMessage.text = "You Failed!"
                return
            }
        }
        failMessage.text = "Success!"
        
        didWin = true
        pauseTimer()
        
        if difficulty == 1 {
                    
//                    guard let secTemp = UserDefaults.standard.data(forKey: easySecKey) else { return }
//                    let easyFastestSec = try! JSONDecoder().decode(Int.self, from: secTemp)
            
            let secTemp = retrieveLabel(Key: easySecKey)
            let minTemp = retrieveLabel(Key: easyMinKey)
            var easyFastestSec:Int? = 0
            var easyFastestMin:Int? = 0
            
            
            
            if Int(secTemp) == 0 {
                easyFastestSec = 10000
            }
            else{
                easyFastestSec = Int(secTemp)
            }
            if Int(minTemp) == 0 {
                easyFastestMin = 10000
            }
            else{
                easyFastestMin = Int(minTemp)
            }
            
//                    guard let minTemp = UserDefaults.standard.data(forKey: easyMinKey) else { return }
//                    let easyFastestMin = try! JSONDecoder().decode(Int.self, from: minTemp)
                    
                    if minutes * 60 + seconds < easyFastestMin!*60 + easyFastestSec! {
                        
                        let easySec  = try? JSONEncoder().encode(seconds)
                        UserDefaults.standard.set(easySec, forKey: easySecKey)
                        
                        let easyMin = try? JSONEncoder().encode(minutes)
                        UserDefaults.standard.set(easyMin, forKey: easyMinKey)
                        
                    }

                }
                if difficulty == 2 {
                    
                    let secTemp = retrieveLabel(Key: easySecKey)
                    let minTemp = retrieveLabel(Key: easyMinKey)
                    var medFastestSec:Int? = 0
                    var medFastestMin:Int? = 0
                    
                    
                    
                    if Int(secTemp) == 0 {
                        medFastestSec = 10000
                    }
                    else{
                        medFastestSec = Int(secTemp)
                    }
                    if Int(minTemp) == 0 {
                        medFastestMin = 10000
                    }
                    else{
                        medFastestMin = Int(minTemp)
                    }
                    
                    if minutes*60 + seconds < medFastestMin!*60 + medFastestSec! {
                        
                        let medSec  = try? JSONEncoder().encode(seconds)
                        UserDefaults.standard.set(medSec, forKey: medSecKey)
                        
                        let medMin = try? JSONEncoder().encode(minutes)
                        UserDefaults.standard.set(medMin, forKey: medMinKey)
                        
                    }
                    
                }
                if difficulty == 3 {
                    
                    let secTemp = retrieveLabel(Key: easySecKey)
                    let minTemp = retrieveLabel(Key: easyMinKey)
                    var hardFastestSec:Int? = 0
                    var hardFastestMin:Int? = 0
                    
                    
                    
                    if Int(secTemp) == 0 {
                        hardFastestSec = 10000
                    }
                    else{
                        hardFastestSec = Int(secTemp)
                    }
                    if Int(minTemp) == 0 {
                        hardFastestMin = 10000
                    }
                    else{
                        hardFastestMin = Int(minTemp)
                    }
                    
                    if minutes*60 + seconds < hardFastestMin!*60 + hardFastestSec! {
                        
                        let hardSec  = try? JSONEncoder().encode(seconds)
                        UserDefaults.standard.set(hardSec, forKey: hardSecKey)
                        
                        let hardMin = try? JSONEncoder().encode(minutes)
                        UserDefaults.standard.set(hardMin, forKey: hardMinKey)
                        
                    }
                    
                }
        
        
                
                        
                    games_won = (Int(retrieveLabel(Key: gamesWonKey)) ?? 0) + 1
                        let totalGamesWon = try? JSONEncoder().encode(games_won)
                        UserDefaults.standard.set(totalGamesWon, forKey: gamesWonKey)
        
        
                        
                        
                        if difficulty == 1{
                            easy_games_won = (Int(retrieveLabel(Key: easyWonKey)) ?? 0) + 1
                            let easyGamesWon = try? JSONEncoder().encode(easy_games_won)
                            UserDefaults.standard.set(easyGamesWon, forKey: easyWonKey)
                            
                        }
                        if difficulty == 2{
                            medium_games_won = (Int(retrieveLabel(Key: medWonKey)) ?? 0) + 1
                            let medGamesWon = try? JSONEncoder().encode(medium_games_won)
                            UserDefaults.standard.set(medGamesWon, forKey: medWonKey)
                            
                        }
                        if difficulty == 3{
                            hard_games_won = (Int(retrieveLabel(Key: hardWonKey)) ?? 0) + 1
                            let hardGamesWon = try? JSONEncoder().encode(hard_games_won)
                            UserDefaults.standard.set(hardGamesWon, forKey: hardWonKey)
                        }
        
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
    
    @IBOutlet weak var GameCollectionView: UICollectionView!
    
    func setEasyPopUp(){
        let puzzle1 = UIAction(title: "Puzzle 1", image: UIImage(systemName: "1.lane")) { (action) in
            
           
            self.didWin = false
            self.restartTimer()
            self.current_board = "Easy Board 1"
            self.difficulty = 1
            self.game_board_cells = Easy_Board_One
            self.GameCollectionView.reloadData()
            
            }

            let puzzle2 = UIAction(title: "Puzzle 2", image: UIImage(systemName: "2.lane")) { (action) in
                /*
                let board = easyBoard2(answerArray: [0])
                self.game_board = board.playBoardLayout
                self.game_groups = board.groupBoardLayout
                self.difficulty = 1
                self.GameCollectionView.reloadData()
                 */
                self.didWin = false
                self.restartTimer()
                self.current_board = "Easy Board 2"
                self.buttonTextEasy()
                self.difficulty = 1
                self.game_board_cells = Easy_Board_Two
                self.GameCollectionView.reloadData()
            }
            let puzzle3 = UIAction(title: "Puzzle 3", image: UIImage(systemName: "3.lane")) { (action) in
//                let board = easyBoard3(answerArray: [0])
//                self.game_board = board.playBoardLayout
//                self.game_groups = board.groupBoardLayout
                self.didWin = false
                self.restartTimer()
                self.current_board = "Easy Board 3"
                self.buttonTextEasy()
                self.difficulty = 1
                self.game_board_cells = Easy_Board_Three
                self.GameCollectionView.reloadData()
                
            }
        let puzzle4 = UIAction(title: "Puzzle 4", image: UIImage(systemName: "4.lane")) { (action) in
            self.didWin = false
            self.restartTimer()
            self.current_board = "Easy Board 4"
            self.buttonTextEasy()
            self.difficulty = 1
            self.game_board_cells = Easy_Board_Four
            self.GameCollectionView.reloadData()
            
        }
        let puzzle5 = UIAction(title: "Puzzle 5", image: UIImage(systemName: "5.lane")) { (action) in
            self.didWin = false
            self.restartTimer()
            self.current_board = "Easy Board 5"
            self.buttonTextEasy()
            self.difficulty = 1
            self.game_board_cells = Easy_Board_Five
            self.GameCollectionView.reloadData()
            
        }

            let menu = UIMenu(title: "Easy Puzzles", options: .displayInline, children: [puzzle1, puzzle2, puzzle3,puzzle4,puzzle5])
                self.easyPopUpMenu.menu = menu
                self.easyPopUpMenu.showsMenuAsPrimaryAction = true
        self.easyPopUpMenu.setTitle("Easy", for: self.easyPopUpMenu.state)
        self.GameCollectionView.reloadData()

    
    }
    func setMedPopUp(){
        let puzzle1 = UIAction(title: "Puzzle 1", image: UIImage(systemName: "1.lane")) { (action) in
            self.didWin = false
            
            self.restartTimer()
            self.current_board = "Medium Board 1"
            self.difficulty = 2
            self.game_board_cells = Medium_Board_One
            self.GameCollectionView.reloadData()
            self.buttonTextMed()
            
            }

            let puzzle2 = UIAction(title: "Puzzle 2", image: UIImage(systemName: "2.lane")) { (action) in
                self.didWin = false
                self.restartTimer()
                self.current_board = "Medium Board 2"
                self.buttonTextMed()
                self.difficulty = 2
                self.game_board_cells = Medium_Board_Two
                self.GameCollectionView.reloadData()

            }
            let puzzle3 = UIAction(title: "Puzzle 3", image: UIImage(systemName: "3.lane")) { (action) in
                self.didWin = false
                self.restartTimer()
                self.current_board = "Medium Board 3"
                self.buttonTextMed()
                self.difficulty = 2
                self.game_board_cells = Medium_Board_Three
                self.GameCollectionView.reloadData()
                
            }
        let puzzle4 = UIAction(title: "Puzzle 4", image: UIImage(systemName: "4.lane")) { (action) in
            self.didWin = false
            self.restartTimer()
            self.current_board = "Medium Board 4"
            self.buttonTextMed()
            self.difficulty = 2
            self.game_board_cells = Medium_Board_Four
            self.GameCollectionView.reloadData()
            
        }
        let puzzle5 = UIAction(title: "Puzzle 5", image: UIImage(systemName: "5.lane")) { (action) in
            self.didWin = false
            self.restartTimer()
            self.current_board = "Medium Board 5"
            self.buttonTextMed()
            self.difficulty = 2
            self.game_board_cells = Medium_Board_Five
            self.GameCollectionView.reloadData()
            
        }

            let menu = UIMenu(title: "Medium Puzzles", options: .displayInline, children: [puzzle1, puzzle2, puzzle3,puzzle4,puzzle5])
                self.medPopUpMenu.menu = menu
                self.medPopUpMenu.showsMenuAsPrimaryAction = true
        
        self.medPopUpMenu.setTitle("Medium", for: self.medPopUpMenu.state)
                self.GameCollectionView.reloadData()

    
    }
    
    
    func setHardPopUp(){
        let puzzle1 = UIAction(title: "Puzzle 1", image: UIImage(systemName: "1.lane")) { (action) in
            self.didWin = false
            self.restartTimer()
            self.current_board = "Hard Board 1"
            self.buttonTextHard()
            self.difficulty = 3
            self.game_board_cells = Hard_Board_One
            self.GameCollectionView.reloadData()

            
            }

            let puzzle2 = UIAction(title: "Puzzle 2", image: UIImage(systemName: "2.lane")) { (action) in
                self.didWin = false
                self.restartTimer()
                self.current_board = "Hard Board 2"
                self.buttonTextHard()
                self.difficulty = 3
                self.game_board_cells = Hard_Board_Two
                self.GameCollectionView.reloadData()

            }
            let puzzle3 = UIAction(title: "Puzzle 3", image: UIImage(systemName: "3.lane")) { (action) in
//                let board = hardBoard3(answerArray: [0])
//                self.game_board = board.playBoardLayout
//                self.game_groups = board.groupBoardLayout
                self.didWin = false
                self.restartTimer()
                self.current_board = "Hard Board 3"
                self.buttonTextHard()
                self.difficulty = 3
                self.game_board_cells = Hard_Board_Three
                self.GameCollectionView.reloadData()
                
            }
        let puzzle4 = UIAction(title: "Puzzle 4", image: UIImage(systemName: "4.lane")) { (action) in
//            let board = hardBoard4(answerArray: [0])
//            self.game_board = board.playBoardLayout
//            self.game_groups = board.groupBoardLayout
            self.didWin = false
            self.restartTimer()
            self.current_board = "Hard Board 4"
            self.buttonTextHard()
            self.difficulty = 3
            self.game_board_cells = Hard_Board_Four
            self.GameCollectionView.reloadData()
            
        }
        let puzzle5 = UIAction(title: "Puzzle 5", image: UIImage(systemName: "5.lane")) { (action) in
//            let board = hardBoard5(answerArray: [0])
//            self.game_board = board.playBoardLayout
//            self.game_groups = board.groupBoardLayout
            self.didWin = false
            self.restartTimer()
            self.current_board = "Hard Board 5"
            self.buttonTextHard()
            self.difficulty = 3
            self.game_board_cells = Hard_Board_Five
            self.GameCollectionView.reloadData()
            
        }

            let menu = UIMenu(title: "Hard Puzzles", options: .displayInline, children: [puzzle1, puzzle2, puzzle3,puzzle4,puzzle5])
                self.hardPopUpMenu.menu = menu
                self.hardPopUpMenu.showsMenuAsPrimaryAction = true
        self.hardPopUpMenu.setTitle("Hard", for: self.hardPopUpMenu.state)
                self.GameCollectionView.reloadData()

    
    }
    
    func buttonTextEasy(){
        medPopUpMenu.setTitle("Medium", for: UIControl.State.normal)
        hardPopUpMenu.setTitle("Hard", for: UIControl.State.normal)
        failMessage.text = ""
        restartTimer()
    }
    func buttonTextMed(){
        easyPopUpMenu.setTitle("Easy", for: UIControl.State.normal)
        hardPopUpMenu.setTitle("Hard", for: UIControl.State.normal)
        failMessage.text = ""
        restartTimer()
    }
    func buttonTextHard(){
        easyPopUpMenu.setTitle("Easy", for: UIControl.State.normal)
        medPopUpMenu.setTitle("Medium", for: UIControl.State.normal)
        failMessage.text = ""
        restartTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        GameCollectionView.dataSource = self
        GameCollectionView.delegate = self
        // Do any additional setup after loading the view.
        setEasyPopUp()
        setMedPopUp()
        setHardPopUp()
        game_board_cells = Easy_Board_One
        easyPopUpMenu.setTitle("Puzzle 1", for: UIControl.State.normal)
        self.GameCollectionView.reloadData()
        
//Debugging Stats
//        UserDefaults.standard.removeObject(forKey: gamesWonKey)
//        UserDefaults.standard.removeObject(forKey: easyWonKey)
//        UserDefaults.standard.removeObject(forKey: medWonKey)
//        UserDefaults.standard.removeObject(forKey: hardWonKey)
//        UserDefaults.standard.removeObject(forKey: easySecKey)
//        UserDefaults.standard.removeObject(forKey: easyMinKey)
    }
    override func viewDidAppear(_ animated: Bool){
        if didWin == false {
            runTimer()
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool){
        pauseTimer()
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    //Goto about page.
    @IBAction func aboutPress(_ sender: Any) {
        let aboutVC = AboutViewController()
        //storyboard!.instantiateViewController(withIdentifier: "aboutVC") as!
        aboutVC.aboutSection = "Each cell in an outlined block must contain a digit: a two-cell block contains the digits 1 and 2, a three-cell block contains the digits 1, 2 and 3; and so on. The same digit must not appear in neighbouring cells, not even diagonally."
        navigationController?.pushViewController(aboutVC, animated: true)
        
        
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        
        favoritesManager.addToFavorite(newFav: current_board)
                let alert = UIAlertController(title: "Puzzle Added", message: "This puzzle has been added to your favorites!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
        
    }
    
    
}


