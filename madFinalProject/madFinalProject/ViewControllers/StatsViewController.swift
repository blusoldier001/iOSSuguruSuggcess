//
//  StatsViewController.swift
//  madFinalProject
//
//  Created by Curtis Hung on 11/13/22.
//

import UIKit

class StatsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var tableData:[String] = []
    
    @IBOutlet weak var favoritesTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = UITableViewCell(style: .default, reuseIdentifier: "favCell")
        temp.textLabel!.text = tableData[indexPath.row]
        return temp
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tableData.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //favorites table
        favoritesTable.dataSource = self
        favoritesTable.delegate = self
        tableData = favoritesManager.getFromFavorites()
        favoritesTable.reloadData()
        
        
        //stats data
        
        
        gamesWonText.text = retrieveLabel(Key:"totalGamesWon")
        easyGamesWonText.text = retrieveLabel(Key: "easyGamesWon")
        medGamesWonText.text = retrieveLabel(Key: "medGamesWon")
        hardGamesWonText.text = retrieveLabel(Key: "hardGamesWon")
        easyTime.text = retrieveTime(minKey: easyMinKey, secKey: easySecKey)
        medTime.text = retrieveTime(minKey: medMinKey, secKey: medSecKey)
        hardTime.text = retrieveTime(minKey: hardMinKey, secKey: hardSecKey)
        

    }
    
    @IBOutlet weak var gamesWonText: UILabel!
    @IBOutlet weak var easyGamesWonText: UILabel!
    @IBOutlet weak var medGamesWonText: UILabel!
    @IBOutlet weak var hardGamesWonText: UILabel!
    
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var easyTime: UILabel!
    @IBOutlet weak var medTime: UILabel!
    @IBOutlet weak var hardTime: UILabel!
    
    
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
    
    func retrieveTime( minKey: String, secKey: String) -> String {
        var minTemp = retrieveLabel(Key: minKey)
        var secTemp = retrieveLabel(Key: secKey)
        let secInt:Int? = Int(secTemp)
        let minInt:Int? = Int(minTemp)
        if secInt! < 10 {
            secTemp = "0" + secTemp
           
        }
        if minInt! < 10 {
            minTemp = "0" + minTemp
        }
        let stringTemp =  minTemp + ":" + secTemp
        return stringTemp
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
