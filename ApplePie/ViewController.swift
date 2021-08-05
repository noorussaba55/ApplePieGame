//
//  ViewController.swift
//  ApplePie
//
//  Created by Noor-us-saba Karim on 22/7/21.
//

import UIKit



class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var userScore = 0
    var totalWins = 0{
        didSet{
            
            userScore += 500
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    var currentGame : Game!

    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var totalScoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
   
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        if currentGame.playerGuessed(letter: letter){
            userScore += 100
        }
        
        updateGameState()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newRound()
    }

    func newRound()  {
       
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetter: [])
            enableLetterButtons(true)
        }
        else{
            enableLetterButtons(false)
        }
        
        updateUI()
        
    }

    func updateUI() {
        
  //      var letters = [String]()
//
//        for letter in currentGame.formattedWord {
//                letters.append(String(letter))
//        }
        
        let  letters = currentGame.formattedWord.map{letter in String(letter)}
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing

        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        totalScoreLabel.text = "\(userScore)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    func updateGameState() {
        
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
            
        }
        
        updateUI()
    
        
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
}

