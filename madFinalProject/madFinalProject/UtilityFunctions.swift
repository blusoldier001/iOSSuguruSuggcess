//
//  UtilityFunctions.swift
//  madFinalProject
//
//  Created by Philip Membrino on 11/13/22.
//

import Foundation
class favoritesManager {
    
    
    static func saveFav(boardArray: [String]){
        let encodedArray = try? JSONEncoder().encode(boardArray)
        UserDefaults.standard.set(encodedArray, forKey: "Favorites")
    }
    
    static func getFromFavorites()->[String]{
        
        guard let Array = UserDefaults.standard.data(forKey: "Favorites") else { return [] }
        let movietime = try! JSONDecoder().decode([String].self, from: Array)
        return movietime
    }
    
    
    static func addToFavorite( newFav: String){
        var currentFavs = getFromFavorites()
        var temp = 0
        for String in currentFavs {
            if String == newFav{
                temp = temp + 1
                return
            }
            
        }
        if temp < 1{
            currentFavs.append(newFav)
            saveFav(boardArray: currentFavs)
        }
    }
    
}
