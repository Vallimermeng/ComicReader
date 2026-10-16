//
//  FavoritesViewModel.swift
//  ComicReader
//
//  Created by Петя on 16.10.2026.
//
import SwiftUI
import Foundation
import Observation

@Observable
class FavoritesViewModel{
    var favorites = UserDefaults.standard.stringArray(forKey: "favorite") ?? []
    
    
    func addFavorites(name: String){
        if !favorites.contains(name){
            favorites.append(name)
            saveFavorites()
        }
    }
    
    func deleteFavorites(name: String){
        favorites.removeAll{
            $0 == name
        }
        saveFavorites()
    }
    
    private func saveFavorites(){
        UserDefaults.standard.set(favorites, forKey: "favorite")
    }
    
    
    
}
