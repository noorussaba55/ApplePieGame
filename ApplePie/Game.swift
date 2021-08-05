//
//  Game.swift
//  ApplePie
//
//  Created by Noor-us-saba Karim on 26/7/21.
//

import Foundation

struct Game {
    
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetter: [Character]
    
    var formattedWord: String{
        
        var guessedWord = ""
        
        for letter in word {
            if guessedLetter.contains(letter)
            {
                guessedWord += "\(letter)"
            }
            else
            {
                guessedWord += "_"
            }
        }
        
        return guessedWord
    }
    
    mutating func playerGuessed(letter:Character)-> Bool{
        
        var didScore = true
        
        guessedLetter.append(letter)
        
        if !(word.contains(letter)) {
            incorrectMovesRemaining -= 1
            didScore = false
        }
        return didScore
    }

}
